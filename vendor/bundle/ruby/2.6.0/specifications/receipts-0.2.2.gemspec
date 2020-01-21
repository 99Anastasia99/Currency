# -*- encoding: utf-8 -*-
# stub: receipts 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "receipts".freeze
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Oliver".freeze]
  s.date = "2018-07-03"
  s.description = "Receipts for your Rails application that works with any payment provider.".freeze
  s.email = ["excid3@gmail.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Receipts for your Rails application that works with any payment provider.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<prawn>.freeze, [">= 1.3.0", "< 3.0.0"])
    s.add_runtime_dependency(%q<prawn-table>.freeze, ["~> 0.2.1"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<prawn>.freeze, [">= 1.3.0", "< 3.0.0"])
    s.add_dependency(%q<prawn-table>.freeze, ["~> 0.2.1"])
  end
end
