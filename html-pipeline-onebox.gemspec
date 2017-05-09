# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html/pipeline/onebox/version'

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-onebox"
  spec.version       = HTML::Pipeline::Onebox::VERSION
  spec.authors       = ["Wojciech Druzkawiecki"]
  spec.email         = ["exerq4@gmail.com"]

  spec.summary       = %q{An HTML::Pipeline filter for Onebox.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/razrfly/html-pipeline-onebox"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "onebox", "~> 1.8"
  spec.add_dependency "html-pipeline", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
