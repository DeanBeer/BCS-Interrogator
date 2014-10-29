module NRB
  class NullHTTPService

    attr_accessor :response

    def initialize(*args)
puts "null_http_service args #{args}"
      self.response = args[0][:response]
    end


    def make_request
      response
    end


  end
end
