# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree_api}
  s.version = "0.40.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David North"]
  s.date = %q{2010-12-22}
  s.description = %q{Required dependancy for Spree}
  s.email = %q{david@railsdog.com}
  s.files = ["LICENSE", "README.md", "app/controllers/admin/users_controller_decorator.rb", "app/controllers/api/base_controller.rb", "app/controllers/api/countries_controller.rb", "app/controllers/api/inventory_units_controller.rb", "app/controllers/api/line_items_controller.rb", "app/controllers/api/orders_controller.rb", "app/controllers/api/products_controller.rb", "app/controllers/api/shipments_controller.rb", "app/controllers/api/states_controller.rb", "app/helpers/api/shipments_helper.rb", "app/models/line_item_decorator.rb", "app/models/user_decorator.rb", "app/views/admin/users/_api_fields.html.erb", "config/cucumber.yml", "config/locales/en.yml", "config/routes.rb", "lib/spree_api.rb", "lib/spree_api_hooks.rb", "lib/tasks/install.rake", "db/migrate/20100107141738_add_api_key_to_users.rb"]
  s.homepage = %q{http://spreecommerce.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubyforge_project = %q{spree_api}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Provides RESTful access for Spree.}

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
