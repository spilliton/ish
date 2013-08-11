# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ish/version"

Gem::Specification.new do |s|
  s.name        = "ish"
  s.license     = 'MIT'
  s.version     = Ish::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Zachary Kloepping"]
  s.homepage    = "https://github.com/spilliton/ish"
  s.summary     = "A ruby gem for when random 'fuzzy' numeric/time results are desired"
  s.files       = Dir['lib/**/*.rb']
  s.test_files  = Dir['test/**/*.rb']

  s.add_dependency 'rake'

  s.add_development_dependency 'activesupport'
end
