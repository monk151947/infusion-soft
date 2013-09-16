# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'IS/version'

Gem::Specification.new do |gem|
  gem.name          = "IS"
  gem.version       = IS::VERSION
  gem.authors       = ["jagdish"]
  gem.email         = ["monk151947@gmail.com"]
  gem.description   = %q{A custom Ruby wrapper for the Infusionsoft API }
  gem.summary       = %q{Methods includes add, update contact to IS and campaign setup }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

