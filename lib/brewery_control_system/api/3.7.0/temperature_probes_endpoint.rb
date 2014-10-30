require File.join File.dirname(__FILE__), "temperature_probe_names_endpoint.rb"
class NRB::BreweryControlSystem::API
  class TemperatureProbesEndpoint

    class << self
      def fetch(api: nil)
        new(api: api).fetch
      end
    end


    def fetch
      names = http_service do |b|
                b.response TemperatureProbeNamesEndpoint
              end.get(TemperatureProbeNamesEndpoint.endpoint).body
      ultemp = http_service do |b|
                    b.response Ultemp
                  end.get(Ultemp.endpoint).body
      temps = ultemp[34..41]
      setpoints = ultemp[42..49]
      names.each_with_index.collect do |name,i|
        NRB::BreweryControlSystem::TemperatureProbe.new name, temps[i], setpoints[i]
      end
    end


    def http_service &block
      api.http_service &block
    end


    def initialize(api: nil)
      raise ArgumentError.new("Need an api") if api.nil?
      self.api = api
    end

  private

    attr_accessor :api

  end
end
