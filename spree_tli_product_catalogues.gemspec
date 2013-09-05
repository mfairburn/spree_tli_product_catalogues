# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_tli_product_catalogues'
  s.version     = '2.0.7'
  s.summary     = 'Add catalogue .pdfs to Spree products'
  s.description = 'Adds the ability to add and display product catalogue .pdfs to Spree products extending standard Spree asset functionality. Supports variants.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Mark Fairburn'
  s.email     = 'mark@praxitar.com'
  s.homepage  = 'http://praxitar.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.4'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
