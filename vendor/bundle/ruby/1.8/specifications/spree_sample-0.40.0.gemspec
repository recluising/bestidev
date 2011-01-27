# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree_sample}
  s.version = "0.40.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Schofield"]
  s.date = %q{2010-12-22}
  s.description = %q{Required dependancy for Spree}
  s.email = %q{sean@railsdog.com}
  s.files = ["LICENSE", "lib/spree_sample.rb", "lib/tasks/install.rake", "db/sample/addresses.yml", "db/sample/adjustments.yml", "db/sample/assets/apache_baseball.png", "db/sample/assets/ror_bag.jpeg", "db/sample/assets/ror_baseball.jpeg", "db/sample/assets/ror_baseball_back.jpeg", "db/sample/assets/ror_baseball_jersey_back_blue.png", "db/sample/assets/ror_baseball_jersey_back_green.png", "db/sample/assets/ror_baseball_jersey_back_red.png", "db/sample/assets/ror_baseball_jersey_blue.png", "db/sample/assets/ror_baseball_jersey_green.png", "db/sample/assets/ror_baseball_jersey_red.png", "db/sample/assets/ror_jr_spaghetti.jpeg", "db/sample/assets/ror_mug.jpeg", "db/sample/assets/ror_mug_back.jpeg", "db/sample/assets/ror_ringer.jpeg", "db/sample/assets/ror_ringer_back.jpeg", "db/sample/assets/ror_stein.jpeg", "db/sample/assets/ror_stein_back.jpeg", "db/sample/assets/ror_tote.jpeg", "db/sample/assets/ror_tote_back.jpeg", "db/sample/assets/ruby_baseball.png", "db/sample/assets.yml", "db/sample/calculators.yml", "db/sample/inventory_units.rb", "db/sample/line_items.yml", "db/sample/option_types.yml", "db/sample/option_values.yml", "db/sample/orders.yml", "db/sample/payment_methods.yml", "db/sample/payments.rb", "db/sample/preferences.yml", "db/sample/product_groups.yml", "db/sample/product_option_types.yml", "db/sample/product_properties.yml", "db/sample/product_scopes.yml", "db/sample/products.rb", "db/sample/products.yml", "db/sample/properties.yml", "db/sample/prototypes.yml", "db/sample/shipments.yml", "db/sample/shipping_categories.yml", "db/sample/shipping_methods.yml", "db/sample/tax_categories.yml", "db/sample/taxonomies.yml", "db/sample/taxons.rb", "db/sample/taxons.yml", "db/sample/users.yml", "db/sample/variants.yml"]
  s.homepage = %q{http://spreecommerce.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubyforge_project = %q{spree_sample}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Sample data (including images) for use with Spree.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["= 0.40.0"])
    else
      s.add_dependency(%q<spree_core>, ["= 0.40.0"])
    end
  else
    s.add_dependency(%q<spree_core>, ["= 0.40.0"])
  end
end
