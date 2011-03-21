module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      # Add your custom site logic here
	Spree::Config.set(:stylesheets => 'screen,besti,homepager')
        #Spree::Config.set(:allow_ssl_in_production => false) 
	Spree::Config.set(:default_locale => 'es')
	Spree::Config.set(:default_country_id => Country.iso_name_like("spain").first.id)
	Spree::Config.set(:logo => "/images/logo.png")
	Spree::Config.set(:admin_products_per_page => 12)
    end
    config.to_prepare &method(:activate).to_proc
  end
end
