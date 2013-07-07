# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tftp/lib/version'

Gem::Specification.new do |spec|
  spec.name          = "tftp-lib"
  spec.version       = TFTP::Lib::VERSION
  spec.authors       = ["Stas Kobzar"]
  spec.email         = ["stas@modulis.ca"]
  spec.description   = %q{TFTP RFC 1350 ruby library}
  spec.summary       = %q{Trivial File Transfer Protocol RFC 1350}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rdoc"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
