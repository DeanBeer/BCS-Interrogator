$:.push File.expand_path('../lib', __FILE__)
require 'bcs_interrogator/version'

Gem::Specification.new do |s|
  s.name          = 'bcs-interrogator'
  s.summary       = 'A gem to intorrogate EEC Brewery Control Systems'
  s.description   = 'Embedded Control Concepts Brewery Control System interrogator'
  s.license       = 'GPL-3'

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
                      'lib/bcs_interrogator.rb',
                      'lib/bcs_interrogator/api.rb',
                      'lib/bcs_interrogator/api/endpoint.rb',
                      'lib/bcs_interrogator/api/response.rb',
                      'lib/bcs_interrogator/api/sysname.rb',
                      'lib/bcs_interrogator/api/ultemp.rb',
                      'lib/bcs_interrogator/entity.rb',
                      'lib/bcs_interrogator/version.rb'

                    ]
  s.test_files    = [ 
                      'spec/spec_helper.rb',
                      'spec/cases/api_spec.rb',
                      'spec/cases/bcs_interrogator_spec.rb'

                    ]
  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NRB::BCSInterrogator.version
end
