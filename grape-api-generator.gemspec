# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "grape-api-generator"
  spec.version       = "0.1.0"
  spec.authors       = ["Vinh Bachsy"]
  spec.email         = ["bsdvinhuit@gmail.com"]

  spec.summary       = %q{A collection of Rails generator scripts for Grape.}
  spec.description   = %q{A collection of Rails generator scripts for Grape.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "grape", ">= 0.11.0"
  spec.add_runtime_dependency "grape-entity"
  spec.add_runtime_dependency "grape-kaminari"
  spec.add_runtime_dependency "grape-swagger"
  spec.add_runtime_dependency "hashie-forbidden_attributes"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rails', '~> 4.2'
end
