class NRB::BreweryControlSystem::API
  class Ultemp < Endpoint
    # http://wiki.embeddedcc.com/index.php/Ultemp.dat
    #   All entries in the ultemp structure have to be in the range
    #   0 <= ultemp < 2^32
    #   Commas are not allowed 

    class << self
      def endpoint; 'ultemp.dat'; end
    end

    register_middleware middleware_options(self)

  private

    def alarm
      body_array[54].to_s(2).rjust(9,"0")[8] == "1"
    end


   def bit_range(data, range)
   end


    def body_array
      super.map { |i| i.to_i }
    end


    def body_array_by_ten(range)
      collect_body_array(range) { |t| t.to_f / 10.0 }
    end


    def collect_body_array(range, &block)
      body_array[range].collect &block
    end


    def decode_current_state(int)
      # http://forum.embeddedcc.com/viewtopic.php?f=9&t=484&p=2513
      ( "%08x" % int ).scan(/[0-9a-f\.]{2}/).reverse.collect { |hex| hex == ".." || hex == "ff" ? nil : hex.to_i(16) }
    end


    def input_statuses
      unmask_boolean body_array[2], 0..7
    end


    def internal_registers
      unmask_boolean body_array[53], 0..15
    end


    def output_statuses
      unmask_boolean body_array[1], 0..17
    end


    def parse
      return if body_array.nil?
      [ *running_processes,
        *output_statuses,
        *input_statuses,
        *temps,
        *setpoints,
        *processes_current_state,
        *process_timers,
        *internal_registers,
        *process_pause_states,
        alarm
      ]
    end


    def process_pause_states
      unmask_boolean body_array[54], 0..7
    end


    def processes_current_state
      [ *decode_current_state(body_array[19]), *decode_current_state(body_array[20]) ]
    end


    def process_timers
      body_array[21..52]
    end


    def running_processes
      unmask_boolean body_array[0], 0..7
    end


    def temps
      body_array_by_ten(3..10)
    end


    def setpoints
      body_array_by_ten(11..18)
    end


    def unmask(masked, range)
      range.collect { |i| masked & (2**i) }
    end


    def unmask_boolean(masked, range)
      unmask(masked, range).collect { |unmasked| unmasked > 0 }
    end

  end
end
