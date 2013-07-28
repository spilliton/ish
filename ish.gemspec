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
  s.summary     = "Adds random fuzzy helper methods to various ruby classes"
  s.files       = Dir['lib/**/*.rb']
  s.test_files  = Dir['test/**/*.rb']

  s.add_dependency 'rake'

  # need to test different versions of active record
  ar_env = ENV['ACTIVE_SUPPORT_VERSION'] || '~> 3.0.0'
  ar_env = ">= 4.0.0" if ar_env == 'latest'
  s.add_dependency 'activesupport', ar_env
end
