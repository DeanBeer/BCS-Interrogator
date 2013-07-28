module NRB
  class BCSInterrogator
    class API

      autoload :Endpoint, 'bcs_interrogator/api/endpoint'
      autoload :Sysname, 'bcs_interrogator/api/sysname'
      autoload :Response, 'bcs_interrogator/api/response'
      autoload :Ultemp, 'bcs_interrogator/api/ultemp'

      API_VERSION = 'BCS 3.7.0'  # Use NRB::BCSInterrogator::API.api_version instead

      def self.api_version; API_VERSION; end


      attr_reader :http_service, :base_url

      def api_call(args,connection_opts={})
        args[:response_class] ||= NRB::BCSInterrogator::API::Response
        response = @http_service.new(args,connection_opts).make_request
        if response.server_version &&
           response.server_version != self.class.api_version
          warn "Firmware version (#{response.server_version}) does not match API version (#{self.class.api_version})."
        end
        response
      end


      def initialize(args={})
        @base_url = args.delete(:base_url)
        raise ArgumentError.new("Please supply a :base_url") unless @base_url
        @http_service = args.delete(:http_service) || NRB::HTTPService
      end


      def sysname; @sysname ||= Sysname.new api: self; end
      def ultemp; @ultemp ||= Ultemp.new api: self; end

    private

      def endpoint_base
        @base_url
      end

    end
  end
end
