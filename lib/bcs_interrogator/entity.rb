module NRB
  class BCSInterrogator
    class Entity

      def initialize(args={})
        @bcs = args[:bcs]
        raise ArgumentError("Please provide a BCS object") if @bcs.nil?
        if args[:positions].is_a?(Fixnum)
          @positions = { output_names: args[:positions],
                         outputs: args[:positions],
                         temp_probe_names: args[:positions],
                         temps: args[:positions],
                         setpoints: args[:positions]
                       }
        else
          @positions = args[:positions]
        end
      end


      def input_name; data :input_names; end
      def last_update; @bcs.last_update; end
      def name; data :temp_probe_names; end
      def output_name; data :output_names; end
      def output; data :outputs; end
      def setpoint; data :setpoints; end
      def temp; data :temps; end
      def update; @bcs.update; end

    private

      def data(lookup)
        update if last_update.nil?
        if @bcs.respond_to?(lookup)
          @bcs.send(lookup)[@positions[lookup]]
        else
          raise ArgumentError.new "No data for #{lookup}"
        end
      end

    end
  end
end
