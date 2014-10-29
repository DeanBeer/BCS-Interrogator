class NRB::BreweryControlSystem::API
  class BCSSys < Endpoint
    # http://wiki.embeddedcc.com/index.php/Bcs_sys.cfg
    #   The configuration file contains of all non-process parameters, with
    #   some exclusions. All entries in the sysname structure cannot be more
    #   than 16 characters, commas are not allowed.

    class << self
      def endpoint; 'bcs_sys.cfg'; end
    end

    DESCRIPTIONS = [
                    'Firmware version',
                    'System Name 0',
                    'System Name 1',
                    'Output 0 Name',
                    'Output 1 Name',
                    'Output 2 Name',
                    'Output 3 Name',
                    'Output 4 Name',
                    'Output 5 Name',
                    'Output 6 Name',
                    'Output 7 Name',
                    'Output 8 Name',
                    'Output 9 Name',
                    'Output 10 Name',
                    'Output 11 Name',
                    'Output 12 Name',
                    'Output 13 Name',
                    'Output 14 Name',
                    'Output 15 Name',
                    'Output 16 Name',
                    'Output 17 Name',
                    'Discrete Output 1 Name',
                    'Discrete Output 2 Name',
                    'Discrete Output 3 Name',
                    'Discrete Output 4 Name',
                    'Discrete Output 5 Name',
                    'Discrete Output 6 Name',
                    'Discrete Output 7 Name',
                    'Discrete Output 8 Name',
                    'Temp Probe 0 Name',
                    'Temp Probe 1 Name',
                    'Temp Probe 2 Name',
                    'Temp Probe 3 Name',
                    'Temp Probe 4 Name',
                    'Temp Probe 5 Name',
                    'Temp Probe 6 Name',
                    'Temp Probe 7 Name',
                    'Reserved 0',
                    'Reserved 1',
                    'Register 0 Name',
                    'Register 1 Name',
                    'Register 2 Name',
                    'Register 3 Name',
                    'Register 4 Name',
                    'Register 5 Name',
                    'Register 6 Name',
                    'Register 7 Name',
                    'Register 8 Name',
                    'Register 9 Name',
                    'Register 10 Name',
                    'Register 11 Name',
                    'Register 12 Name',
                    'Register 13 Name',
                    'Register 14 Name',
                    'Register 15 Name',
                    'Process 0 State',
                    'Process 1 State',
                    'Process 2 State',
                    'Process 3 State',
                    'Output 0,6,12 Value',
                    'Output 1,7,13 Value',
                    'Output 2,8,14 Value',
                    'Output 3,9,15 Value',
                    'Output 4,10,16 Value',
                    'Output 5,11,17 Value',
                    'Discrete Input 0,4 Value',
                    'Discrete Input 1,5 Value',
                    'Discrete Input 2,6 Value',
                    'Discrete Input 3,7 Value',
                    'Process 0,4 Web Input 0 Value',
                    'Process 0,4 Web Input 1 Value',
                    'Process 0,4 Web Input 2 Value',
                    'Process 0,4 Web Input 3 Value',
                    'Process 1,5 Web Input 0 Value',
                    'Process 1,5 Web Input 1 Value',
                    'Process 1,5 Web Input 2 Value',
                    'Process 1,5 Web Input 3 Value',
                    'Process 2,6 Web Input 0 Value',
                    'Process 2,6 Web Input 1 Value',
                    'Process 2,6 Web Input 2 Value',
                    'Process 2,6 Web Input 3 Value',
                    'Process 3,7 Web Input 0 Value',
                    'Process 3,7 Web Input 1 Value',
                    'Process 3,7 Web Input 2 Value',
                    'Process 3,7 Web Input 3 Value',
                    'Process 0,4 Run',
                    'Process 1,5 Run',
                    'Process 2,6 Run',
                    'Proces,7 Run',
                    'Manual Mode Run',
                    'BCS Version',  # 0=BCS-460, 2=BCS-462
                    'Reserved 0',
                    'Reserved 1',
                    'Discrete Input 0,4 Enable',
                    'Discrete Input 1,5 Enable',
                    'Discrete Input 2,6 Enable',
                    'Discrete Input 3,7 Enable',
                    'Process 0,4 Web Input 0 Enable',
                    'Process 0,4 Web Input 1 Enable',
                    'Process 0,4 Web Input 2 Enable',
                    'Process 0,4 Web Input 3 Enable',
                    'Process 1,5 Web Input 0 Enable',
                    'Process 1,5 Web Input 1 Enable',
                    'Process 1,5 Web Input 2 Enable',
                    'Process 1,5 Web Input 3 Enable',
                    'Process 2,6 Web Input 0 Enable',
                    'Process 2,6 Web Input 1 Enable',
                    'Process 2,6 Web Input 2 Enable',
                    'Process 2,6 Web Input 3 Enable',
                    'Process 3,7 Web Input 0 Enable',
                    'Process 3,7 Web Input 1 Enable',
                    'Process 3,7 Web Input 2 Enable',
                    'Process 3,7 Web Input 3 Enable',
                    'Output 0,6,12 Enable',
                    'Output 1,7,13 Enable',
                    'Output 2,8,14 Enable',
                    'Output 3,9,15 Enable',
                    'Output 4,10,16 Enable',
                    'Output 5,11,17 Enable',
                    'Temp 0,4 Enable',
                    'Temp 1,5 Enable',
                    'Temp 2,6 Enable',
                    'Temp 3,7 Enable',
                   ].freeze

    register_middleware middleware_options(self)

  private

    def body_array
      super.map { |val| val.strip[/.+/m] }
    end


    def parse
      return if body_text.nil?
body_array[0..55] + body_array[248..252].map { |i| i.to_f / 10.0 }
#      body_array.each_with_index.inject({}) do |hash,(body,i)|
#        hash[descriptions[i]] = body_array[i]
#        hash
#      end
    end

  end
end
