module NRB; class BCSInterrogator
  class API

    autoload :APIVersionCheck, 'bcs_interrogator/api/api_version_check'
    autoload :Endpoint,        'bcs_interrogator/api/endpoint'
    autoload :Response,        'bcs_interrogator/api/response'
    autoload :Sysname,         'bcs_interrogator/api/sysname'
    autoload :Ulsysio,         'bcs_interrogator/api/ulsysio'
    autoload :Ultemp,          'bcs_interrogator/api/ultemp'

    API_VERSION = 'BCS 3.7.0'  # Use NRB::BCSInterrogator::API.api_version instead

    if Faraday::Response.respond_to? :register_middleware
      Faraday::Response.register_middleware api_version_check: APIVersionCheck
    end

    def self.api_version; API_VERSION; end


    attr_reader :http_service, :base_url


    def api_call(args,connection_opts={})
      args[:response_class] ||= NRB::BCSInterrogator::API::Response
      response = http_service.new(args,connection_opts).make_request
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
end; end
