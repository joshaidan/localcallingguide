# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'localcallingguide/version'

Gem::Specification.new do |spec|
  spec.name          = "localcallingguide"
  spec.version       = LocalCallingGuide::VERSION
  spec.authors       = ["Brian Jones"]
  spec.email         = ["joshaidan@gmail.com"]

  spec.summary       = %q{Wrapper for localcallingguide.com}
  spec.description   = %q{A Ruby based wrapper for localcallingguide.com}
  spec.homepage      = "https://github.com/joshaidan/localcallingguide"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)

  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rubocop", "~> 0.34"

  spec.add_runtime_dependency "xml-simple", "~> 1.1.5"
end
