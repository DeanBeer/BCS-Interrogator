class NRB::BreweryControlSystem::API
  class TemperatureProbesEndpoint
    # http://www.embeddedcc.com/api-docs/#!/temp

    class << self
      def fetch(api:nil)
        new(api: api).fetch
      end
    end


    def fetch
      setpoints = http_service.get(endpoint).body
      0.upto(setpoints.size - 1).collect do |i|
        probe = http_service.get(endpoint(i)).body
        NRB::BreweryControlSystem::TemperatureProbe.new probe["name"],
                                                        probe["temp"],
                                                        probe["setpoint"],
                                                        probe["resistance"],
                                                        probe["enabled"],
                                                        probe["coefficients"]
      end
    end


    def initialize(api: nil)
      self.api = api
    end

  private

    attr_accessor :api

    def endpoint(i=nil)
      'api/temp' + (i.nil? ? '' : "/#{i}")
    end


    def http_service
      api.http_service do |b|
        b.response Endpoint
      end
    end

  end

end
