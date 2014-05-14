# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'obj/version'

Gem::Specification.new do |spec|
  spec.name          = 'obj'
  spec.version       = OBJ::VERSION
  spec.authors       = ['Ignacio Contreras Pinilla']
  spec.email         = ['ignacio.con.pin@gmail.com']
  spec.summary       = %q{Simple OBJ (wavefront model format) file utils}
  spec.description   = %q{}
  spec.homepage      = 'https://github.com/iconpin/obj'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 0'
end
