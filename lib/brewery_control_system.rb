module NRB
  class BreweryControlSystem
    require 'brewery_control_system/version'

    autoload :API,         'brewery_control_system/api'
    autoload :HTTPService, 'brewery_control_system/http_service'
    autoload :Input,       'brewery_control_system/input'
    autoload :Middleware,  'brewery_control_system/middleware'

    attr_reader :base_url

    def api_version
      @api_version ||= probe
    end


    def device
      api.device
    end


    def discrete_inputs
      # 8
      api.discrete_inputs
    end


    def firmware_version
      device.version
    end


    def firmware_build
      device.build
    end


    def http_service &block
      http_service_class.default_service url: base_url, &block
    end


    def initialize(api_class: API, base_url: nil, http_service_class: HTTPService, api_version: nil)
      self.api_class = api_class
      @base_url = base_url; @base_url.freeze
      self.http_service_class = http_service_class
      @api_version = api_version
    end


    def inputs
      # 8
      []
    end
    alias_method :discrete_inputs, :inputs


    def name
      device.name
    end


    def outputs
      # 18
      api.outputs
    end


    def probe
      http_service do |b|
        b.response :bcs_probe
      end.get('/').body
    end


    def processes
      # 8
      # 8 states
      # 4 timers
      # 4 web inputs
      []
    end


    def setpoints
      api.setpoints
    end


    def temp_probes
      []
    end


    def type
      device.type
    end

  private

    attr_accessor :api_class, :http_service_class
    attr_reader :base_url
    attr_writer :api

    def api
      @api ||= api_class.new base_url: base_url, bcs: self
    end

  end
end

require 'brewery_control_system/api/probe'
