module NRB
  class BCSInterrogator
    class API
      class Response

        attr_reader :status, :body, :headers

        def errored?
          ! success?
        end


        def initialize(args)
          @status = args[:status]
          @body = process_body args[:body]
          @headers = args[:headers]
        end


        def server_version
          @headers.nil? ? "" : @headers["server"].sub(/\s+\(http:\/\/www\.embeddedcc\.com\)$/, '')
        end


        def success?
          @status >= 200 && @status < 300
        end

      private

        def process_body(body_string)
          @body = body_string.split(',').map { |str| str.strip }
        end

      end
    end
  end
end
