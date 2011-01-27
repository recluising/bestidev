# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree}
  s.version = "0.40.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Schofield"]
  s.date = %q{2010-12-22}
  s.description = %q{Spree is an open source e-commerce framework for Ruby on Rails.  Join us on the spree-user google group or in #spree on IRC}
  s.email = %q{sean@railsdog.com}
  s.files = ["README.md", "lib/generators/spree/extension_generator.rb", "lib/generators/spree/site_generator.rb", "lib/generators/spree/test_app_generator.rb", "lib/generators/templates/config/database.yml", "lib/generators/templates/config/environments/cucumber.rb", "lib/generators/templates/extension/extension.rb.tt", "lib/generators/templates/extension.gemspec.tt", "lib/generators/templates/Gemfile", "lib/generators/templates/gitignore.tt", "lib/generators/templates/hooks.rb.tt", "lib/generators/templates/install.rake.tt", "lib/generators/templates/lib/tasks/%file_name%.rake.tt", "lib/generators/templates/LICENSE", "lib/generators/templates/Rakefile.tt", "lib/generators/templates/README.md", "lib/generators/templates/routes.rb", "lib/generators/templates/spec_helper.rb", "lib/generators/templates/spree_site.rb", "lib/spree.rb", "lib/tasks/install.rake"]
  s.homepage = %q{http://spreecommerce.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubyforge_project = %q{spree}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Full-stack e-commerce framework for Ruby on Rails.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_auth>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_api>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_dash>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_sample>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_promo>, ["= 0.40.0"])
    else
      s.add_dependency(%q<spree_core>, ["= 0.40.0"])
      s.add_dependency(%q<spree_auth>, ["= 0.40.0"])
      s.add_dependency(%q<spree_api>, ["= 0.40.0"])
      s.add_dependency(%q<spree_dash>, ["= 0.40.0"])
      s.add_dependency(%q<spree_sample>, ["= 0.40.0"])
      s.add_dependency(%q<spree_promo>, ["= 0.40.0"])
    end
  else
    s.add_dependency(%q<spree_core>, ["= 0.40.0"])
    s.add_dependency(%q<spree_auth>, ["= 0.40.0"])
    s.add_dependency(%q<spree_api>, ["= 0.40.0"])
    s.add_dependency(%q<spree_dash>, ["= 0.40.0"])
    s.add_dependency(%q<spree_sample>, ["= 0.40.0"])
    s.add_dependency(%q<spree_promo>, ["= 0.40.0"])
  end
end
