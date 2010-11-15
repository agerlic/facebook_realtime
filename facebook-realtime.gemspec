# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "facebook-realtime/version"

Gem::Specification.new do |s|
  s.name        = "facebook-realtime"
  s.version     = FacebookRealTime::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['agerlic']
  s.email       = ['alex@gerlic.net']
  s.homepage    = "http://rubygems.org/gems/facebook-realtime"
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "facebook-realtime"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency(%q<rest-client>, [">= 0"])
end
