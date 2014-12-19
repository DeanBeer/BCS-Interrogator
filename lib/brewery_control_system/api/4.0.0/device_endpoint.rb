class NRB::BreweryControlSystem::API
  class DeviceEndpoint < Endpoint
    # http://www.embeddedcc.com/api-docs/#!/device

    class << self
      def endpoint; 'api/device'; end
    end

    register_middleware middleware_options(self)

  end
end
