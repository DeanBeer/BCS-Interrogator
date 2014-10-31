# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brewery_control_system/version'

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
                      'lib/brewery_control_system.rb',
                      'lib/brewery_control_system/api.rb',
                      'lib/brewery_control_system/api/3.7.0/bcs_sys.rb',
                      'lib/brewery_control_system/api/3.7.0/device_endpoint.rb',
                      'lib/brewery_control_system/api/3.7.0/endpoint.rb',
                      'lib/brewery_control_system/api/3.7.0/setpoints.rb',
                      'lib/brewery_control_system/api/3.7.0/sysname.rb',
                      'lib/brewery_control_system/api/3.7.0/temperature_probe_names_endpoint.rb',
                      'lib/brewery_control_system/api/3.7.0/temperature_probes_endpoint.rb',
                      'lib/brewery_control_system/api/3.7.0/temps.rb',
                      'lib/brewery_control_system/api/3.7.0/ultemp.rb',
                      'lib/brewery_control_system/api/device.rb',
                      'lib/brewery_control_system/api/server_version.rb',
                      'lib/brewery_control_system/api/version_check.rb',
                      'lib/brewery_control_system/http_service.rb',
                      'lib/brewery_control_system/http_service/user_agent.rb',
                      'lib/brewery_control_system/input.rb',
                      'lib/brewery_control_system/middleware.rb',
                      'lib/brewery_control_system/middleware/registration.rb',
                      'lib/brewery_control_system/output.rb',
                      'lib/brewery_control_system/temperature_probe.rb',
                      'lib/brewery_control_system/version.rb'
                    ]
  s.test_files    = [ 
                      'spec/spec_helper.rb',
                      'spec/cases/bcs_interrogator/api_spec.rb',
                      'spec/cases/bcs_interrogator_spec.rb'

                    ]
  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NRB::BreweryControlSystem.version
end
