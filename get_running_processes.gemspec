# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_running_processes/version'

Gem::Specification.new do |gem|
  gem.name          = "get_running_processes"
  gem.version       = GetRunningProcesses::VERSION
  gem.authors       = ["Casey Ellett"]
  gem.email         = ["casey.ellett@gmail.com"]
  gem.description   = %q{Get running processes on a linux system through the output of 'ps -ef'}
  gem.summary       = %q{Get running processes from ps}
  gem.homepage      = "https://github.com/odin/get_running_processes"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

end
