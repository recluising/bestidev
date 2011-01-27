# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree_promo}
  s.version = "0.40.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David North"]
  s.date = %q{2010-12-22}
  s.description = %q{Required dependancy for Spree}
  s.email = %q{david@railsdog.com}
  s.files = ["app/controllers/admin/promotion_rules_controller.rb", "app/controllers/admin/promotions_controller.rb", "app/models/calculator/free_shipping.rb", "app/models/promotion/rules/first_order.rb", "app/models/promotion/rules/item_total.rb", "app/models/promotion/rules/product.rb", "app/models/promotion/rules/user.rb", "app/models/promotion.rb", "app/models/promotion_credit.rb", "app/models/promotion_rule.rb", "app/views/admin/promotion_rules/create.js.erb", "app/views/admin/promotion_rules/destroy.js.erb", "app/views/admin/promotions/_form.html.erb", "app/views/admin/promotions/_promotion_rule.html.erb", "app/views/admin/promotions/_tab.html.erb", "app/views/admin/promotions/edit.html.erb", "app/views/admin/promotions/index.html.erb", "app/views/admin/promotions/new.html.erb", "app/views/admin/promotions/rules/_first_order.html.erb", "app/views/admin/promotions/rules/_item_total.html.erb", "app/views/admin/promotions/rules/_product.html.erb", "app/views/admin/promotions/rules/_user.html.erb", "app/views/products/_promotions.html.erb", "config/locales/en.yml", "config/routes.rb", "lib/spree_promo.rb", "lib/spree_promo_hooks.rb", "lib/tasks/install.rake", "lib/tasks/promotions.rake", "lib/tasks/promotions_extension_tasks.rake", "db/migrate/20100419190933_rename_coupons_to_promotions.rb", "db/migrate/20100419194457_fix_existing_coupon_credits.rb", "db/migrate/20100426100726_create_promotion_rules.rb", "db/migrate/20100501084722_match_policy_for_promotions.rb", "db/migrate/20100501095202_create_promotion_rules_users.rb", "db/migrate/20100502163939_name_for_promotions.rb", "db/migrate/20100923095305_update_calculable_type_for_promotions.rb", "public/javascripts/admin/promotions.js", "public/stylesheets/admin/promotions.css"]
  s.homepage = %q{http://spreecommerce.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubyforge_project = %q{spree_promo}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Promotion functionality for use with Spree.}

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
