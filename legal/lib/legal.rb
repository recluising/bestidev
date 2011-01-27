require 'spree_core'
require 'legal_hooks'

module Legal
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
 #     Spree::Config.set(:default_locale => 'es')
 #    Spree::Config.set(:logo => "/images/logo.png")
#		Spree::Config.set(:default_country_id => Country.iso_name_like("spain").first.id)
    end

    config.to_prepare &method(:activate).to_proc
  end
end
