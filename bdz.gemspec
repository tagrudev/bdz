# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bdz/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Todor Grudev"]
  gem.email         = ["tagrudev@gmail.com"]
  gem.description   = %q{BDZ query maker}
  gem.summary       = %q{Gives a routes for the Bulgarian railways}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bdz"
  gem.require_paths = ["lib"]
  gem.version       = Bdz::VERSION


  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 2.0"
  gem.add_development_dependency "webmock", "~> 1.6"
end
