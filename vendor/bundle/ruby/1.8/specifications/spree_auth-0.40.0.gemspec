# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree_auth}
  s.version = "0.40.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Schofield"]
  s.date = %q{2010-12-22}
  s.description = %q{Required dependancy for Spree}
  s.email = %q{sean@railsdog.com}
  s.files = ["LICENSE", "README.md", "app/controllers/admin_controller_decorator.rb", "app/controllers/checkout_controller_decorator.rb", "app/controllers/orders_controller_decorator.rb", "app/controllers/resource_controller_decorator.rb", "app/controllers/spree/base_controller_decorator.rb", "app/controllers/user_password_resets_controller.rb", "app/controllers/user_registrations_controller.rb", "app/controllers/user_sessions_controller.rb", "app/controllers/users_controller.rb", "app/helpers/users_helper.rb", "app/models/ability.rb", "app/models/order_decorator.rb", "app/models/spree_auth_configuration.rb", "app/models/spree_current_order_decorator.rb", "app/models/tokenized_permission.rb", "app/models/user.rb", "app/models/user_mailer.rb", "app/views/checkout/registration.html.erb", "app/views/shared/_error_messages.html.erb", "app/views/shared/_flashes.html.erb", "app/views/shared/_login.html.erb", "app/views/shared/_login_bar.html.erb", "app/views/shared/_user_form.html.erb", "app/views/shared/unauthorized.html.erb", "app/views/user_mailer/reset_password_instructions.text.erb", "app/views/user_password_resets/edit.html.erb", "app/views/user_password_resets/new.html.erb", "app/views/user_registrations/new.html.erb", "app/views/user_sessions/authorization_failure.html.erb", "app/views/user_sessions/new.html.erb", "app/views/users/edit.html.erb", "app/views/users/show.html.erb", "config/initializers/devise.rb", "config/locales/en.yml", "config/routes.rb", "lib/spree/auth/config.rb", "lib/spree/token_resource.rb", "lib/spree_auth.rb", "lib/tasks/auth.rake", "lib/tasks/install.rake", "db/migrate/20101101185116_rename_columns_for_devise.rb", "db/migrate/20101214150824_convert_user_remember_field.rb", "db/migrate/20101217012656_create_tokenized_permissions.rb", "db/migrate/20101219201531_tokens_for_legacy_orders.rb", "db/sample/users.rb"]
  s.homepage = %q{http://spreecommerce.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubyforge_project = %q{spree_auth}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Provides authentication and authorization services for use with Spree.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<devise>, ["= 1.2.rc"])
      s.add_runtime_dependency(%q<cancan>, [">= 1.3.3"])
    else
      s.add_dependency(%q<spree_core>, ["= 0.40.0"])
      s.add_dependency(%q<devise>, ["= 1.2.rc"])
      s.add_dependency(%q<cancan>, [">= 1.3.3"])
    end
  else
    s.add_dependency(%q<spree_core>, ["= 0.40.0"])
    s.add_dependency(%q<devise>, ["= 1.2.rc"])
    s.add_dependency(%q<cancan>, [">= 1.3.3"])
  end
end
