require 'bcs_interrogator/version'
require 'NRB_http_service'

module NRB
  class BCSInterrogator

    autoload :API, 'bcs_interrogator/api'

    attr_reader :api

    def initialize(args={})
      @api = API.new args[:api_args]
    end


  end
end
