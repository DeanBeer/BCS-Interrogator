# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brewery_control_system/version'
# i = BCSInterrogator.new base_url: 'http://10.0.0.254'

Gem::Specification.new do |s|
  s.name          = 'bcs-interrogator'
  s.summary       = 'A gem to intorrogate EEC Brewery Control Systems'
  s.description   = 'Embedded Control Concepts Brewery Control System interrogator'
  s.license       = 'GPL-3'

  s.homepage          = 'https://github.com/NewRepublicBrewing/BCS-Interrogator'
  s.rubyforge_project = 'bcs-interrogator'

  s.add_dependency 'faraday-http-cache'

  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

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
                      'spec/cases/bcs_interrogator/api_spec.rb',
                      'spec/cases/bcs_interrogator_spec.rb'

                    ]
  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NRB::BCSInterrogator.version
end
