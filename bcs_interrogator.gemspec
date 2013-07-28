$:.push File.expand_path('../lib', __FILE__)
require 'bcs-interrogator/version'

Gem::Specification.new do |s|
  s.name          = 'bcs-interrogator'
  s.summary       = 'A gem to intorrogate EEC Brewery Control Systems'
  s.description   = ''

  s.homepage          = 'https://github.com/NewRepublicBrewing/BCS-Interrogator'
  s.rubyforge_project = 'bcs-interrogator'

  s.add_dependency 'faraday', '~> 0.0'
  s.add_dependency 'NRB_http_service', '~> 0.0'

  s.add_development_dependency 'guard-rspec', '~> 2.0'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 2.0'
  s.add_development_dependency 'rb-inotify', '~> 0.0' # Filesystem watcher for Guard on Linux

  s.authors       = ['Dean Brundage']
  s.email         = ['dean@newrepublicbrewing.com']

  s.files         = [
                      'LICENSE',
                      'README.md',
                      'lib/bcs-interrogator/version.rb'
                    ]
  s.test_files    = [ 
                      'spec/spec_helper.rb'
                    ]
  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NRB::BCSInterrogator.version
end
