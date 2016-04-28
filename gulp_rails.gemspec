$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gulp_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gulp_rails"
  s.version     = GulpRails::VERSION
  s.authors     = ["Jordan Byron"]
  s.email       = ["jordan.byron@gmail.com"]
  s.summary     = "GulpRails: Scripts and helpers for using gulp with Rails"
  s.description = "Installs gulp scripts and configures Rails to use gulp side by side with the asset pipeline"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails",       ">= 3.2.22"
  s.add_dependency "react-rails", ">= 1.6.2"

  s.add_development_dependency "sqlite3"
end
