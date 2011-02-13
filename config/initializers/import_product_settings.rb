# This file is the thing you have to config to match your application

class ImportProductSettings

    #Take a look at the data you need to be importing, and then change this hash accordingly
    #The first column is 0, etc etc.
    #This is accessed in the import method using COLUMN_MAPPINGS['field'] for niceness and readability
    #TODO this could probably be marked up in YML
    COLUMN_MAPPINGS = {
      'Seccion' => 0,
      'PN' => 1,
      'Fabricante' => 2,
      'Referencia' => 3,
      'foto' => 4,
      'Descripcion-es' => 5,
      'Descripcion-en' => 6,
      'Coste' => 7,
      'Precio' => 8,
      'Volumen' => 9,
      'Talla' => 10,
      'Color' => 11,
      'Stock' => 17,
      'Wert' => 18
    }

    #Where are you keeping your master images?
    #This path is the path that the import code will search for filenames matching those in your CSV file
    #As each product is saved, Spree (Well, paperclip) grabs it, transforms it into a range of sizes and
    #saves the resulting files somewhere else - this is just a repository of originals.
    #PRODUCT_IMAGE_PATH = "#{Rails.root}/lib/etc/product-data/product-images/"
    PRODUCT_IMAGE_PATH = "#{Rails.root}/xtra/catalogo/ver4/fotos/"
    # Variants file
    VARIANTS_PATH = "#{Rails.root}/xtra/catalogo/ver4/"
         
    #From experience, CSV files from clients tend to have a few 'header' rows - count them up if you have them,
    #and enter this number in here - the import script will skip these rows.
    INITIAL_ROWS_TO_SKIP = 1

    #I would just leave this as is - Logging is useful for a batch job like this - so
    # useful in fact, that I have put it in a separate log file.
    LOGFILE = File.join(Rails.root, '/log/', "import_products_#{Rails.env}.log")
    
    #Set this to true if you want to destroy your existing products after you have finished importing products
    DESTROY_ORIGINAL_PRODUCTS_AFTER_IMPORT = false
end
