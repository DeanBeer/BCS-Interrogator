class NRB::BreweryControlSystem::API
  class DeviceEndpoint < Endpoint
    # http://wiki.embeddedcc.com/index.php/Bcs_sys.cfg

    class << self
      def endpoint; 'bcs_sys.cfg'; end
    end

    register_middleware middleware_options(self)

  private

    def body_array
      super.map { |val| val.strip[/.+/m] }
    end


    def parse
      return {} if body_text.nil?
      (device, version) = body_array[0].split(/\s+/)
      { "name" => body_array[1], "type" => device, "version" => version }
    end

  end
end
