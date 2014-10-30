require 'faraday'

module NRB; class BCSInterrogator
  class API::Ulsysio < Faraday::Response::Middleware
    # http://wiki.embeddedcc.com/index.php/Ulsysio.dat
    #   System variables and settings
    #   All entries in the ulsysio structure have to be in the range
    #   0 <= ulsysio < 2^32
    #   Commas are not allowed 

    def on_complete(env)
      env[:body] = parse env[:body]
    end

    if Faraday::Middleware.respond_to? :register_middleware
      Faraday::Response.register_middleware ulsysio: self
    end

  private

    def parse(body)
      body && body.split(/,/) #.map { |str| str.to_i }
    end

  end
end; end
