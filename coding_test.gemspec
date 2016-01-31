# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "coding_test"
  spec.version       = '0.1.0'
  spec.authors       = ['Titus Fortner']
  spec.email         = ['titusfortner@gmail.com']

  spec.summary       = %q{Basic Ruby Coding Test.}
  spec.description   = %q{Test Driven Development approached coding exam.}
  spec.homepage      = 'https://github.com/titusfortner/code_test'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'http://nogemserver.com'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
