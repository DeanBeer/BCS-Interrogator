class NRB::BreweryControlSystem
  class API

    autoload :Device,        'brewery_control_system/api/device'
    autoload :Probe,         'brewery_control_system/api/probe'
    autoload :ServerVersion, 'brewery_control_system/api/server_version'
    autoload :UserAgent,     'brewery_control_system/api/user_agent'
    autoload :VersionCheck,  'brewery_control_system/api/version_check'

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
                           end.get(device_endpoint).body
      Device.new *@device_response
    end

    # Temperature Probes
    #   name          string
    #   temp          integer
    #   setpoint      integer
    #   resistance    integer
    #   enabled       boolean
    #   coefficients  array

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

    def discrete_inputs
      [ sysname['Din 0 name'],
        sysname['Din 1 name'],
        sysname['Din 2 name'],
        sysname['Din 3 name'],
        sysname['Din 4 name'],
        sysname['Din 5 name'],
        sysname['Din 6 name'],
        sysname['Din 7 name']
      ]
    end


    def initialize(api_version: '3.7.0', base_url: nil, bcs: nil)
      self.base_url = base_url
      self.bcs = bcs
      self.api_version = api_version

      autoload_endpoints
    end


    def outputs
      [ sysname['Output 0 name'],
        sysname['Output 1 name'],
        sysname['Output 2 name'],
        sysname['Output 3 name'],
        sysname['Output 4 name'],
        sysname['Output 5 name'],
        sysname['Output 6 name'],
        sysname['Output 7 name'],
        sysname['Output 8 name'],
        sysname['Output 9 name'],
        sysname['Output 10 name'],
        sysname['Output 11 name'],
        sysname['Output 12 name'],
        sysname['Output 13 name'],
        sysname['Output 14 name'],
        sysname['Output 15 name'],
        sysname['Output 16 name'],
        sysname['Output 17 name'],
      ]
    end


    def setpoints
      ultemp #.setpoints
    end


  private

    attr_accessor :base_url, :bcs, :api_version

    def autoload_endpoints
      self.class.autoload :DeviceEndpoint, "brewery_control_system/api/#{api_version}/device_endpoint"
      self.class.autoload :BCSSys, "brewery_control_system/api/#{api_version}/bcs_sys"
      self.class.autoload :Endpoint, "brewery_control_system/api/#{api_version}/endpoint"
      self.class.autoload :Sysname, "brewery_control_system/api/#{api_version}/sysname"
      self.class.autoload :Ultemp, "brewery_control_system/api/#{api_version}/ultemp"
    end


    def device_endpoint
      DeviceEndpoint.endpoint
    end


    def http_service
      service = bcs.http_service do |b|
                  b.response VersionCheck, api_version
                end
      yield service if block_given?
      service
    end


    def sysname
      http_service do |b|
        b.response Sysname
      end.get(sysname_endpoint).body
    end


    def sysname_endpoint
      Sysname.endpoint
    end


    def ultemp_endpoint
      Ultemp.endpoint
    end


    def ultemp
      http_service do |b|
        b.response Ultemp
      end.get(ultemp_endpoint).body
    end

  end
end
