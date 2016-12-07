# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shape_up/version'

Gem::Specification.new do |spec|
  spec.name          = "shape_up"
  spec.version       = ShapeUp::VERSION
  spec.authors       = ["Jonathan Gnagy"]
  spec.email         = ["jonathan.gnagy@gmail.com"]

  spec.summary       = %q{A library for shapes}
  spec.description   = %q{A library for describing the basics of simple shapes}
  spec.homepage      = 'https://github.com/jgnagy/shape_up'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end