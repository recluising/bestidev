# This model is the master routine for uploading products
# Requires Paperclip and FasterCSV to upload the CSV file and read it nicely.

# Author:: Josh McArthur
# License:: MIT

class ProductImport < ActiveRecord::Base
  has_attached_file :data_file, :path => ":rails_root/lib/etc/product_data/data-files/:basename.:extension"
  validates_attachment_presence :data_file
  
  require 'fastercsv'
  require 'pp'
  
  ## Data Importing:
  # Supplier, room and category are all taxonomies to be found (or created) and associated
  # Model maps to product name, description, brochure text and bullets 1 - 8 are combined to form description
  # List Price maps to Master Price, Current MAP to Cost Price, Net 30 Cost unused
  # Width, height, Depth all map directly to object
  # Image main is created independtly, then each other image also created and associated with the product
  # Meta keywords and description are created on the product model
  
  def import_data
    begin
      #Get products *before* import - 
      @products_before_import = Product.all
      @products_before_import.each { |p| p.destroy }
      OptionType.all.each{ |p| p.destroy }

      columns = ImportProductSettings::COLUMN_MAPPINGS
      rows = FasterCSV.read(self.data_file.path)
      
     
      log("Importing products for #{self.data_file_file_name}, path is #{self.data_file.path} began at #{Time.now}")
      num_imported = 0

      rows[ImportProductSettings::INITIAL_ROWS_TO_SKIP..-1].each do |row|
        product_information = {}
        num_imported += 1
        next if (row[columns['Fabricante']] =~ /FAST/).nil?
        
        #Easy ones first
        product_information[:sku] = row[columns['PN']]
        product_information[:name] = row[columns['Referencia']]
        # remove commas from prices, assume the point is the decimal separator
        product_information[:price] = format_price row[columns['Precio']] unless row[columns['Precio']].nil?
        product_information[:cost_price] = format_price row[columns['Coste']] unless row[columns['Coste']].nil?
        product_information[:available_on] = DateTime.now - 1.day #Yesterday to make SURE it shows up
        product_information[:description] = row[columns['Descripcion-es']]  unless row[columns['Descripcion-es']].nil?
        product_information[:on_hand] = row[columns['Stock']]  unless row[columns['Stock']].nil?

        log("Importing #{product_information[:sku]}, named #{product_information[:name]}, price #{product_information[:price]}")

        #Create the product skeleton - should be valid
        product_obj = Product.new(product_information)
        unless product_obj.valid?
          log("A product could not be imported - here is the information we have:\n #{ pp product_information}", :error)
          next
        end
        
        #Save the object before creating asssociated objects
        product_obj.save

        # apply the properties if relevant
        find_and_assign_property_value('Volumen', row[columns['Volumen']], product_obj)

        #Now we have all but images and taxons loaded
        # Seccion + Fabricante
        associate_taxon('Productos', seccion(row[columns['Seccion']]), product_obj)
        associate_taxon('Marcas', row[columns['Fabricante']], product_obj)
        
        #Just images 
        ipath = ImportProductSettings::PRODUCT_IMAGE_PATH 
        imagefiles = Dir.new(ipath).entries.select{|f|f.include?(row[columns['PN']])}
        imagefiles.each{|f| find_and_attach_image(f, product_obj)} unless imagefiles.empty?
        log("#{imagefiles.size} found for #{product_information[:sku]}, named #{product_information[:name]}")
        #find_and_attach_image(row[columns['Image Main']], product_obj)
        #find_and_attach_image(row[columns['Image 2']], product_obj)
        #find_and_attach_image(row[columns['Image 3']], product_obj)
        #find_and_attach_image(row[columns['Image 4']], product_obj)

      # now the variants (this works, but can be implemented more elegant :)
      variants_name = File.basename(self.data_file_file_name, ".csv") + "_variants.csv"
      variantsfile = ImportProductSettings::VARIANTS_PATH + variants_name 
      File.open(variantsfile).readlines.each do |l|
        mpn,pn,ot,val,stock,price = l.split(",")
        price = format_price price.chomp unless price.nil?
        if product_obj.sku == mpn then
          opt_type = product_obj.option_types.select{|o| o.name == ot}.first
	  opt_type = product_obj.option_types.create(:name => ot, :presentation => ot.capitalize) if opt_type.nil?
          new_value = opt_type.option_values.create(:name => val, :presentation => val)
	  ovariant = product_obj.variants.create(:sku => pn)
          ovariant.count_on_hand = stock
          ovariant.price = price unless price.nil?
	  ovariant.option_values << new_value
          imagefiles = Dir.new(ipath).entries.select{|f|f.include?(pn)}
          unless imagefiles.empty?
            imagefiles.each{|f| find_and_attach_image(f, ovariant)} 
            log("#{imagefiles.size} found for variants of #{product_information[:sku]},named #{product_information[:name]}")
          end
          log(" variant priced #{ovariant.price} with sku #{pn} saved for #{product_information[:sku]},named #{product_information[:name]}")
	  ovariant.save!
        end
      end
      
      log("product  #{product_obj.sku} was imported at #{DateTime.now}")
    end
      
    rescue Exception => exp
      log("An error occurred during import, please check file and try again. (#{exp.message})\n#{exp.backtrace.join('\n')}", :error)
      return [:error, "The file data could not be imported. Please check that the spreadsheet is a CSV file, and is correctly formatted."]
    end
    
    #All done!
    return [:notice, "Product data was successfully imported by fer."]
  end
  
 
  private 
  
  ### MISC HELPERS ####
  ### format price 
  def format_price(price)
    price.gsub("€","").gsub(",","").to_f
  end
  
  #Log a message to a file - logs in standard Rails format to logfile set up in the import_products initializer
  #and console.
  #Message is string, severity symbol - either :info, :warn or :error
  
  def log(message, severity = :info)   
    @rake_log ||= ActiveSupport::BufferedLogger.new(ImportProductSettings::LOGFILE)
    message = "[#{Time.now.to_s(:db)}] [#{severity.to_s.capitalize}] #{message}\n"
    @rake_log.send severity, message
    puts message
  end
  ### PRODUCT PROPERTIES
  def find_and_assign_property_value(property_name, property_value, product_obj)
    return if property_value.blank?
    # find or create the property itself
    property = Property.find_by_name(property_name)
    property = Property.create(:name => property_name, :presentation => property_name) if property.nil?
    # create the new product_property 
    pp = ProductProperty.new
    pp.product = product_obj
    pp.property = property
    pp.value = property_value
    pp.save
  end
  
  ### IMAGE HELPERS ###
  
  ## find_and_attach_image
  #   The theory behind this method is:
  #     - We know where an 'image dump' of high-res images is - could be remote folder, or local
  #     - We know that the provided filename SHOULD be in this folder
  def find_and_attach_image(filename, product)
    #Does the file exist? Can we read it?
    return if filename.blank?
    filename = ImportProductSettings::PRODUCT_IMAGE_PATH + filename
    unless File.exists?(filename) && File.readable?(filename)
      log("Image #{filename} was not found on the server, so this image was not imported.", :warn)
      return nil
    end
    
    #An image has an attachment (duh) and some object which 'views' it
    product_image = Image.new({:attachment => File.open(filename, 'rb'), 
                              :viewable => product,
                              :position => product.images.length
                              }) 
    
    product.images << product_image if product_image.save
  end

  
  ### TAXON HELPERS ###  
  def associate_taxon(taxonomy_name, taxon_name, product)
    master_taxon = Taxonomy.find_by_name(taxonomy_name)
    
    if master_taxon.nil?
      master_taxon = Taxonomy.create(:name => taxonomy_name)
      log("Could not find Category taxonomy, so it was created.", :warn)
    end
    
    taxon = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id(
      taxon_name, 
      master_taxon.root.id, 
      master_taxon.id
    )
    
    product.taxons << taxon if taxon.save
  end

  def seccion(code)
    case code
      when 'VAR' then return "Varios"
      when 'ATL' then return "Atletismo"
      when 'CIC' then return "Ciclismo"
      when 'NAT' then return "Natación"
      when 'NUT' then return "Nutrición"
      else return "Otros"
    end
  end
  
  ### END TAXON HELPERS ###
end
