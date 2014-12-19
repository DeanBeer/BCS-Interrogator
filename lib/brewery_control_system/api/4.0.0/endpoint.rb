require 'json'

class NRB::BreweryControlSystem::API
  class Endpoint < Faraday::Response::Middleware

    extend NRB::BreweryControlSystem::Middleware::Registration

    class << self

      def middleware_name; self; end


      def middleware_options(endpoint)
        opts = Hash.new
        opts[middleware_name] = endpoint
        opts
      end

    end


    def on_complete(env)
      self.body_text = env[:body]
      env[:body] = parse
    end

    register_middleware middleware_options(self)

  private

    attr_accessor :body_text

    def parse
      JSON.parse(body_text)
    end

  end
end
