lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "protocreds/version"

Gem::Specification.new do |spec|
  spec.name          = "protocreds"
  spec.version       = Protocreds::VERSION
  spec.authors       = ["Tony Arcieri"]
  spec.email         = ["bascule@gmail.com"]
  spec.licenses      = ["Apache-2.0"]
  spec.homepage      = "https://github.com/protocreds/protocreds-ruby"
  spec.summary       = "Protobuf-based credential format, inspired by ideas from Macaroons and SPKI/SDSI"
  spec.description   = <<-DESCRIPTION.strip.gsub(/\s+/, " ")
    A credential format based on Google Protocol Buffers, based on concepts
    originally from the SPKI/SDSI credential formats and Macaroons.
  DESCRIPTION

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1"

  spec.add_runtime_dependency "protobuf",   ">= 3.6.0"
  spec.add_runtime_dependency "objecthash", ">= 1.0.0"
  spec.add_runtime_dependency "sysrandom",  ">= 1.0.0"
end
