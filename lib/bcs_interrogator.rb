module NRB
  class BCSInterrogator

    autoload :API, 'bcs_interrogator/api'
    autoload :Entity, 'bcs_interrogator/entity'
    autoload :Process, 'bcs_interrogator/state'

    attr_reader :api, :last_update

    def initialize(args={})
      @api = API.new base_url: normalize_base_url(args[:base_url])
    end

    def input_names;      api.sysname.input_names;      end
    def input_statuses;   api.ultemp.input_statuses;    end

    def output_names;     api.sysname.output_names;     end
    def output_statuses;  api.ultemp.output_statuses;   end

    def process_names; []; end

    def state_names; []; end

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

  private

    def normalize_base_url(url)
      url.sub(/\/$/, '')
    end

  end
end

defined?(BCSInterrogator) || BCSInterrogator = NRB::BCSInterrogator
