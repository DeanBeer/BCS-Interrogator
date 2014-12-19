class NRB::BreweryControlSystem::API
  class PollEndpoint < Endpoint
    # currently undocumented

    class << self
      def endpoint; 'api/poll'; end
    end

    register_middleware middleware_options(self)

  end
end
