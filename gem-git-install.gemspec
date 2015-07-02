# coding: utf-8
lib = File.expand_path('../lib', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "gem-git-install"
  spec.version       = "1.0.0"
  spec.authors       = ["Cristian Bica"]
  spec.email         = ["cristian.bica@gmail.com"]

  spec.summary       = %q{Install gem from a git repo}
  spec.description   = %q{Install gem from a git repository. This gem clones the given repo, build the gem and installs it.}
  spec.homepage      = "https://github.com/cristianbica/gem-git-install"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
