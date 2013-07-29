gem 'NRB_http_service'

module NRB

  autoload :HTTPService, 'NRB_http_service'

  class BCSInterrogator

    autoload :API, 'bcs_interrogator/api'
    autoload :Entity, 'bcs_interrogator/entity'

    attr_reader :api, :last_update

    def initialize(args={})
      @api = API.new base_url: args[:base_url]
    end

    def input_names;      api.sysname.input_names;      end
    def inputs;           api.ultemp.outputs;           end
    def output_names;     api.sysname.output_names;     end
    def outputs;          api.ultemp.outputs;           end
    def temp_probe_names; api.sysname.temp_probe_names; end
    def temps;            api.ultemp.temps;             end
    def setpoints;        api.ultemp.setpoints;         end

    def update(args={})
      api.ultemp.api_call
      if args[:deep]
         api.sysname.api_call
      end
      @last_update = Time.now
      true
    end

  end
end
