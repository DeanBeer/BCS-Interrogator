class NRB::BreweryControlSystem
  class API

    autoload :Device,           'brewery_control_system/api/device'
    autoload :ServerVersion,    'brewery_control_system/api/server_version'
    autoload :TemperatureProbe, 'brewery_control_system/api/temperature_probe'
    autoload :VersionCheck,     'brewery_control_system/api/version_check'

    # Device
    #   name     string
    #   type     string
    #   version  string
    #   build    string
    # 3.x
    #   /bcs_sys.cfg
    # 4.x
    #   /device
    def device
      @device_response ||= http_service do |b|
                             b.response DeviceEndpoint
                           end.get(DeviceEndpoint.endpoint).body
      Device.new *@device_response
    end


    def http_service
      service = bcs.http_service do |b|
                  b.response VersionCheck, api_version
                end
      yield service if block_given?
      service
    end


    # Temperature Probes
    #   name          string
    #   temp          integer
    #   setpoint      integer
    #   resistance    integer
    #   enabled       boolean
    #   coefficients  array
    def temperature_probes
      TemperatureProbesEndpoint.fetch api: self
    end

    # Digital Inputs
    #   name     string
    #   on       boolean
    #   enabled  boolean
    #   oneshot  boolean

    # Outputs
    #   name     string
    #   on       boolean
    #   enabled  boolean

    # Processes
    #  name            string
    #  running         boolean
    #  paused          boolean
    #  run_on_startup  boolean
    #  current_state   state
    #                    name   string
    #                    state  integer

    def initialize(api_version: '3.7.0', base_url: nil, bcs: nil)
      self.base_url = base_url
      self.bcs = bcs
      self.api_version = api_version

      require_endpoints
    end

  private

    attr_accessor :base_url, :bcs, :api_version

    def require_endpoints
      %w( endpoint
          device_endpoint
          setpoints
          temps
          temperature_probes_endpoint
          ultemp
        ).each do |f|
        begin
          require "brewery_control_system/api/#{api_version}/#{f}"
        rescue LoadError => e
          warn "API v#{api_version} may not function: #{e}"
        end
      end
    end

  end
end
