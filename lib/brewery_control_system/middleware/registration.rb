module NRB::BreweryControlSystem::Middleware
  module Registration

    def register_middleware(*args)
      if Faraday::Response.respond_to? :register_middleware
        if args.empty?
          Faraday::Response.register_middleware self => self
        else
          Faraday::Response.register_middleware *args
        end
      else
        warn "Can't register #{self.class.name} as middleware"
      end

    end

  end
end
