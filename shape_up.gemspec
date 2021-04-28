# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shape_up/version'

Gem::Specification.new do |spec|
  spec.name          = 'shape_up'
  spec.version       = ShapeUp::VERSION
  spec.authors       = ['Jonathan Gnagy']
  spec.email         = ['jonathan.gnagy@gmail.com']

  spec.summary       = 'A library for shapes'
  spec.description   = 'A library for describing the basics of simple shapes'
  spec.homepage      = 'https://github.com/jgnagy/shape_up'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 3.0'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.13'
  spec.add_development_dependency 'rubocop-rake', '~> 0.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.2'
  spec.add_development_dependency 'simplecov', '~> 0.21'
  spec.add_development_dependency 'travis', '~> 1.10'
  spec.add_development_dependency 'yard', '~> 0.9', '>= 0.9.26'
end
