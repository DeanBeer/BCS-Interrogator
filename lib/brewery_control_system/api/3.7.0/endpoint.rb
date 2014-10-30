class NRB::BreweryControlSystem::API
  class Endpoint < Faraday::Response::Middleware

    extend NRB::BreweryControlSystem::Middleware::Registration

    class << self

      def descriptions;
        const_defined?(:DESCRIPTIONS) ? const_get(:DESCRIPTIONS) : []
      end


      def middleware_name; self; end


      def middleware_options(endpoint)
        opts = Hash.new
        opts[middleware_name] = endpoint
        opts
      end

    end


    def descriptions; self.class.descriptions; end


    def on_complete(env)
      self.body_text = env[:body]
      env[:body] = parse
    end

  private

    attr_accessor :body_text
    attr_reader :body_array

    def body_array
      return unless body_text
      @body_array ||= body_text.split(/,/)
    end


    def parse
    end

  end
end
