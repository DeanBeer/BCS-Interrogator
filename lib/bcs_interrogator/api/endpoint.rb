module NRB; class BCSInterrogator
  class API
    class Endpoint

      include Enumerable

      attr_reader :response

      def self.descriptions
       const_defined?(:DESCRIPTIONS) ? const_get(:DESCRIPTIONS) : nil
      end


      def self.endpoint
        const_defined?(:ENDPOINT) ? const_get(:ENDPOINT) : nil
      end


      def data
        return @data if @data
        api_call
        @data
      end


      def descriptions
        self.class.descriptions
      end


      def each(&block)
        data.each(block)
      end


      def endpoint
        api.base_url + self.class.endpoint
      end


      def initialize(args={})
        @api = args.delete(:api)
        raise ArgumentError.new("Please supply an API object") unless api
      end


      def to_a
        data
      end


      def to_h
        descriptions.each_with_index.inject({}) do |hash,(descr,i)|
          hash[descr] = data[i]
          hash
        end
      end

    private

      def api
        @api
      end


      def api_call(args={})
        args[:verb] ||= :get
        args[:url] ||= endpoint
        @response = api.api_call args
        @data = @response.body
        @response
      end

    end
  end
end; end
