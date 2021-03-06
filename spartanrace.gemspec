# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spartanrace/version'

Gem::Specification.new do |spec|
  spec.name          = 'spartanrace'
  spec.version       = SpartanRace::VERSION
  spec.authors       = ['<maharvey2>']
  spec.email         = ['<mah0013mobile@gmail.com>']

  spec.summary       = 'Find Spartan races near user.'
  spec.description   = 'Find Spartan races near user zip.'
  spec.homepage      = 'https://github.com/maharvey2/spartanrace'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/maharvey2/spartanrace'
  spec.metadata['changelog_uri'] = 'https://github.com/maharvey2/spartanrace'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'httparty'
  spec.add_development_dependency 'json'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rest-client'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
