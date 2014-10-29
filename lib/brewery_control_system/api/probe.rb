require 'faraday'
class NRB::BreweryControlSystem::API
  class Probe < ::Faraday::Response::Middleware

    extend NRB::BreweryControlSystem::Middleware::Registration
    include NRB::BreweryControlSystem::API::ServerVersion

    def on_complete(env)
      env[:body] = server_version env[:response_headers]
    end

    register_middleware

  end
end
