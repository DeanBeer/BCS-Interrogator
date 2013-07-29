module NRB
  class BCSInterrogator
    class API
      class Ultemp < Endpoint
        # http://wiki.embeddedcc.com/index.php/Ultemp.dat
        #   All entries in the ultemp structure have to be in the range
        #   0 <= ultemp < 2^32
        #   Commas are not allowed 

        DESCRIPTIONS = [
                         'Running Process (proc_en) (7:0)',
                         'Discrete Outputs (17:0)',
                         'Discrete Inputs (8:0)',
                         'Temp0 * 10',
                         'Temp1 * 10',
                         'Temp2 * 10',
                         'Temp3 * 10',
                         'Temp4 * 10',
                         'Temp5 * 10',
                         'Temp6 * 10',
                         'Temp7 * 10',
                         'Temp0 Setpoint * 10',
                         'Temp1 Setpoint * 10',
                         'Temp2 Setpoint * 10',
                         'Temp3 Setpoint * 10',
                         'Temp4 Setpoint * 10',
                         'Temp5 Setpoint * 10',
                         'Temp6 Setpoint * 10',
                         'Temp7 Setpoint * 10',
                         'Current State - P0(31:24) P1(23:16) P2(15:8) P3(7:0)',
                         'Current State - P4(31:24) P5(23:16) P6(15:8) P7(7:0)',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Process Timer 0 [P0:P7][T0:T3]',
                         'Internal Registers (15:0)',
                         'Miscellaneous
Bit 8: Alarm
Bits 7:0 : Process[7:0] Pause'
                       ]

        ENDPOINT = '/ultemp.dat'

        def inputs
          bitmasked_data 0..7, 2
        end


        def outputs
          bitmasked_data 0..17, 1
        end


        def temps
          data_by_ten(3..10)
        end


        def setpoints
          data_by_ten(11..18)
        end

      private

        def collect_data(range, &block)
          data[range].collect &block
        end


        def bitmasked_data(range, data_pos)
          collect_data(range) { |i| data[data_pos].to_i & (2**i) > 0 }
        end


        def data_by_ten(range)
          collect_data(range) { |t| t.to_f / 10.0 }
        end

      end
    end
  end
end
