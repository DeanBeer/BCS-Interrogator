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

  s.add_development_dependency 'guard'
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
                      'lib/brewery_control_system/api/4.0.0/device_endpoint.rb',
                      'lib/brewery_control_system/api/4.0.0/endpoint.rb',
                      'lib/brewery_control_system/api/4.0.0/poll_endpoint.rb',
                      'lib/brewery_control_system/api/4.0.0/temperature_probes_endpoint.rb',
                      'lib/brewery_control_system/api/server_version.rb',
                      'lib/brewery_control_system/api/version_check.rb',
                      'lib/brewery_control_system/http_service.rb',
                      'lib/brewery_control_system/http_service/user_agent.rb',
                      'lib/brewery_control_system/middleware.rb',
                      'lib/brewery_control_system/middleware/registration.rb',
                      'lib/brewery_control_system/models/device.rb',
                      'lib/brewery_control_system/models/input.rb',
                      'lib/brewery_control_system/models/output.rb',
                      'lib/brewery_control_system/models/temperature_probe.rb',
                      'lib/brewery_control_system/version.rb'
                    ]

  s.test_files    = [ 
                      'spec/cases/brewery_control_system/api/3.7.0/device_endpoint_spec.rb',
                      'spec/cases/brewery_control_system/api/3.7.0/endpoint_spec.rb',
                      'spec/cases/brewery_control_system/api/3.7.0/setpoints_spec.rb',
                      'spec/cases/brewery_control_system/api/3.7.0/temperature_probe_names_endpoint_spec.rb',
                      'spec/cases/brewery_control_system/api/3.7.0/temperature_probes_endpoint_spec.rb',
                      'spec/cases/brewery_control_system/api/3.7.0/temps_spec.rb',
                      'spec/cases/brewery_control_system/api/3.7.0/ultemp_spec.rb',
                      'spec/cases/brewery_control_system/api/server_version_spec.rb',
                      'spec/cases/brewery_control_system/api/version_check_spec.rb',
                      'spec/cases/brewery_control_system/api_spec.rb',
                      'spec/cases/brewery_control_system/http_service/user_agent_spec.rb',
                      'spec/cases/brewery_control_system/http_service_spec.rb',
                      'spec/cases/brewery_control_system/models/device_spec.rb',
                      'spec/cases/brewery_control_system/models/input_spec.rb',
                      'spec/cases/brewery_control_system/models/output_spec.rb',
                      'spec/cases/brewery_control_system/models/temperature_probe_spec.rb',
                      'spec/cases/brewery_control_system/version_spec.rb',
                      'spec/cases/brewery_control_system_spec.rb',
                      'spec/shared_examples/3.7.0_endpoint.rb',
                      'spec/spec_helper.rb',
                      'spec/support/null_app.rb',
                      'spec/support/null_http_service.rb'
                    ]

  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NRB::BreweryControlSystem.version
end
