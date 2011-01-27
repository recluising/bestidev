# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree_dash}
  s.version = "0.40.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Quinn"]
  s.date = %q{2010-12-22}
  s.description = %q{Required dependancy for Spree}
  s.email = %q{brian@railsdog.com}
  s.files = ["LICENSE", "README.md", "app/controllers/admin/overview_controller.rb", "app/views/admin/overview/index.html.erb", "config/routes.rb", "lib/spree_dash.rb", "lib/tasks/install.rake", "public/javascripts/dashboard.js", "public/javascripts/jqPlot/excanvas.min.js", "public/javascripts/jqPlot/jquery.jqplot.min.js", "public/javascripts/jqPlot/plugins/jqplot.canvasAxisLabelRenderer.min.js", "public/javascripts/jqPlot/plugins/jqplot.canvasAxisTickRenderer.min.js", "public/javascripts/jqPlot/plugins/jqplot.canvasTextRenderer.min.js", "public/javascripts/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js", "public/javascripts/jqPlot/plugins/jqplot.dateAxisRenderer.min.js", "public/javascripts/jqPlot/plugins/jqplot.highlighter.min.js", "public/javascripts/jqPlot/plugins/jqplot.pieRenderer.min.js", "public/stylesheets/admin/dashboard.css"]
  s.homepage = %q{http://spreecommerce.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubyforge_project = %q{spree_dash}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Overview dashboard for use with Spree.}

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
