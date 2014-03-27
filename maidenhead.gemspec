# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: maidenhead 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "maidenhead"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael Graff"]
  s.date = "2014-03-27"
  s.description = "Convert between latitude/longitude and Maidenhead Locator System strings"
  s.email = "explorer@flame.org"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".travis.yml",
    "Gemfile",
    "Guardfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/maidenhead.rb",
    "maidenhead.gemspec",
    "test/helper.rb",
    "test/test_maidenhead.rb"
  ]
  s.homepage = "http://github.com/skandragon/maidenhead"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.0"
  s.summary = "Maidenhead Locator System conversion"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.7"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-minitest>, [">= 0"])
      s.add_development_dependency(%q<rubysl>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.7"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-minitest>, [">= 0"])
      s.add_dependency(%q<rubysl>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.7"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-minitest>, [">= 0"])
    s.add_dependency(%q<rubysl>, [">= 0"])
  end
end

