# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cashier_cotendo/version"

Gem::Specification.new do |s|
  s.name        = "cashier_cotendo"
  s.version     = CashierCotendo::VERSION
  s.authors     = ["Avi Tzurel"]
  s.email       = ["avi@kensodev.com"]
  s.homepage    = ""
  s.summary     = %q{Cashier gem plugin for invalidating cotendo full page cache}
  s.description = %q{Cashier gem plugin for invalidating cotendo full page cache}

  s.rubyforge_project = "cashier_cotendo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rails', '~> 3.0'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'redis', '~> 2.2.0'
end
