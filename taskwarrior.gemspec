# -*- encoding: utf-8 -*-
require File.expand_path('../lib/taskwarrior/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.summary       = %q{Ruby wrapper for TaskWarrior}
  gem.description   = %q{Wraps access to TaskWarrior, the command-line task manager, in a Ruby gem.}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "taskwarrior"
  gem.require_paths = ["lib"]
  gem.version       = TaskWarrior::VERSION

  gem.add_dependency 'activemodel', '~> 3.2'
  gem.add_dependency 'multi_json', '~> 1.3'
  
  gem.add_development_dependency 'activesupport', '~> 3.2'
  gem.add_development_dependency 'twtest', '~> 0.0.6'
  gem.add_development_dependency 'guard-test', '~> 0.5'
  gem.add_development_dependency 'guard-bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.9'

  gem.add_development_dependency 'pry'
end
