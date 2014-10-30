class NRB::BreweryControlSystem::API
  class TemperatureProbeNamesEndpoint < Endpoint
    # http://wiki.embeddedcc.com/index.php/sysname.dat
    class << self
      def endpoint; 'sysname.dat'; end
    end

    register_middleware middleware_options(self)

  private

    def body_array
      super.map { |val| val.strip[/.+/m] }
    end


    def parse
      [ *body_array[63..66], *body_array[85..88] ].compact
    end
  end
end
