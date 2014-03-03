$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bk_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bk_blog"
  s.version     = BkBlog::VERSION
  s.authors     = ["Josh Horner"]
  s.email       = ["josh@bkmediagroup.com"]
  s.summary     = "bkblog time summary."
  s.description = "bkblog time description."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "redcarpet"
  s.add_dependency "paperclip"
  s.add_dependency "will_paginate"
  s.add_dependency "devise"

  s.add_development_dependency "sqlite3"
end
