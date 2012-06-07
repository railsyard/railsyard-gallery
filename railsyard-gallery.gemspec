# -*- encoding: utf-8 -*-

require File.expand_path('../lib/railsyard/gallery/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "railsyard-gallery"
  gem.version       = Railsyard::Gallery::VERSION
  gem.summary       = %q{Simplified images and galleries creation for Railsyard}
  gem.description   = %q{With railsyard-gallery, you are able to DRY up your models and freely associate images and galleries to your models.}
  gem.license       = "MIT"
  gem.authors       = ["Stefano Verna"]
  gem.email         = "s.verna@cantierecreativo.net"
  gem.homepage      = "https://github.com/stefanoverna/railsyard-gallery#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'yard', '~> 0.7'
end
