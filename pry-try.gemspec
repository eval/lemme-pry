# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pry-try/version'

Gem::Specification.new do |spec|
  spec.name          = "pry-try"
  spec.version       = PryTry::VERSION
  spec.authors       = ["Gert Goet"]
  spec.email         = ["gert@thinkcreate.nl"]

  spec.summary       = %q{Quickly try a gem or script on the repl}
  spec.description   = %q{Start a pry-session with specific gems or a (remote) script loaded.}
  spec.homepage      = "https://gitlab.com/eval/pry-try/tree/master#pry-try"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1'
  spec.add_dependency "pry", "~>0.10"
  spec.add_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
