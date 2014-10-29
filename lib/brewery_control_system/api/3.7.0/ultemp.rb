class NRB::BreweryControlSystem::API
  class Ultemp < Endpoint
    # http://wiki.embeddedcc.com/index.php/Ultemp.dat
    #   All entries in the ultemp structure have to be in the range
    #   0 <= ultemp < 2^32
    #   Commas are not allowed 

    class << self
      def endpoint; 'ultemp.dat'; end
    end

    DESCRIPTIONS = [
                     'Running Process (proc_en) (7:0)',
                     'Discrete Outputs (17:0)',
                     'Discrete Inputs (8:0)',
                     'Temp 0',
                     'Temp 1',
                     'Temp 2',
                     'Temp 3',
                     'Temp 4',
                     'Temp 5',
                     'Temp 6',
                     'Temp 7',
                     'Temp0 Setpoint',
                     'Temp1 Setpoint',
                     'Temp2 Setpoint',
                     'Temp3 Setpoint',
                     'Temp4 Setpoint',
                     'Temp5 Setpoint',
                     'Temp6 Setpoint',
                     'Temp7 Setpoint',
                     'Current State - P0(31:24) P1(23:16) P2(15:8) P3(7:0)',
                     'Current State - P4(31:24) P5(23:16) P6(15:8) P7(7:0)',
                     'Process Timer 0 [P0:P7][T0:T3]',
                     'Process Timer 1 [P0:P7][T0:T3]',
                     'Process Timer 2 [P0:P7][T0:T3]',
                     'Process Timer 3 [P0:P7][T0:T3]',
                     'Process Timer 4 [P0:P7][T0:T3]',
                     'Process Timer 5 [P0:P7][T0:T3]',
                     'Process Timer 6 [P0:P7][T0:T3]',
                     'Process Timer 7 [P0:P7][T0:T3]',
                     'Process Timer 8 [P0:P7][T0:T3]',
                     'Process Timer 9 [P0:P7][T0:T3]',
                     'Process Timer 10 [P0:P7][T0:T3]',
                     'Process Timer 11 [P0:P7][T0:T3]',
                     'Process Timer 12 [P0:P7][T0:T3]',
                     'Process Timer 13 [P0:P7][T0:T3]',
                     'Process Timer 14 [P0:P7][T0:T3]',
                     'Process Timer 15 [P0:P7][T0:T3]',
                     'Process Timer 16 [P0:P7][T0:T3]',
                     'Process Timer 17 [P0:P7][T0:T3]',
                     'Process Timer 18 [P0:P7][T0:T3]',
                     'Process Timer 19 [P0:P7][T0:T3]',
                     'Process Timer 20 [P0:P7][T0:T3]',
                     'Process Timer 21 [P0:P7][T0:T3]',
                     'Process Timer 22 [P0:P7][T0:T3]',
                     'Process Timer 23 [P0:P7][T0:T3]',
                     'Process Timer 24 [P0:P7][T0:T3]',
                     'Process Timer 25 [P0:P7][T0:T3]',
                     'Process Timer 26 [P0:P7][T0:T3]',
                     'Process Timer 27 [P0:P7][T0:T3]',
                     'Process Timer 28 [P0:P7][T0:T3]',
                     'Process Timer 29 [P0:P7][T0:T3]',
                     'Process Timer 30 [P0:P7][T0:T3]',
                     'Process Timer 31 [P0:P7][T0:T3]',
                     'Internal Registers (15:0)',
                     'Miscellaneous
Bit 8: Alarm
Bits 7:0 : Process[7:0] Pause'
                   ].freeze

    register_middleware middleware_options(self)

  private

    def body_array
      super.map { |i| i.to_i }
    end


    def parse
      return if body_text.nil?
#      body_array.each_with_index do |body,i|
#        puts "#{body} (#{body.class})"
#      end

      self.data = body_array
puts "#{data}"

      {
        descriptions[0] => data[0],
        descriptions[1] => output_statuses,
        descriptions[2] => input_statuses,
        descriptions[3] => temps[0],
        descriptions[4] => temps[1],
        descriptions[5] => temps[2],
        descriptions[6] => temps[3],
        descriptions[7] => temps[4],
        descriptions[8] => temps[5],
        descriptions[9] => temps[6],
        descriptions[10] => temps[7],
        descriptions[11] => setpoints[0],
        descriptions[12] => setpoints[1],
        descriptions[13] => setpoints[2],
        descriptions[14] => setpoints[3],
        descriptions[15] => setpoints[4],
        descriptions[15] => setpoints[5],
        descriptions[17] => setpoints[6],
        descriptions[18] => setpoints[7],
      }
    end

    ##############################################

        def input_statuses
          bitmasked_data 0..7, 2
        end


        def output_statuses
          bitmasked_data 0..17, 1
        end


        def temps
          data_by_ten(3..10)
        end


        def setpoints
          data_by_ten(11..18)
        end

      private

        attr_accessor :data

        def collect_data(range, &block)
          data[range].collect &block
        end


        def bitmasked_data(range, data_pos)
          raise "data_pos may not be negative" if data_pos < 0
          masked_data = data[data_pos].to_i
          range.collect { |i| masked_data & (2**i) > 0 }
        end


        def data_by_ten(range)
          collect_data(range) { |t| t.to_f / 10.0 }
        end
    ##############################################

      end
    end
