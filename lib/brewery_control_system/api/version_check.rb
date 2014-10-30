class NRB::BreweryControlSystem::API
  class VersionCheck < Faraday::Response::Middleware

    extend NRB::BreweryControlSystem::Middleware::Registration
    include NRB::BreweryControlSystem::API::ServerVersion

    attr_reader :required_version

    def initialize(app=nil,version=nil)
      raise ArgumentError.new("Must supply an api version to compare against") if version.nil?
      super app
      @required_version = version
    end


    def on_complete(env)
      remote_version = server_version env[:response_headers]
      if remote_version != required_version
        warn "BCS Firmware version (#{remote_version}) does not match API version (#{required_version})."
      end
    end

    register_middleware

  end
end
