require 'faraday-http-cache'
class NRB::BreweryControlSystem
  class HTTPService

    autoload :UserAgent, 'brewery_control_system/http_service/user_agent'

    class << self

      attr_writer :default_adapter

      def default_adapter; @default_adapter ||= Faraday.default_adapter; end


      def default_service(cache_store: nil, options: nil, url: nil, &block)
        debug = options.delete(:debug)
        Faraday.new url, options do |b|
          b.use(:logger) if debug
#          b.use :http_cache, store: cache_store
          yield b if block_given?
          b.use UserAgent
          b.adapter default_adapter
        end
      end

    end

  end
end
