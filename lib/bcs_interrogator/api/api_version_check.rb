module NRB; class BCSInterrogator
  class API::APIVersionCheck < Faraday::Response::Middleware

    def on_complete(env)
      @headers = env[:response_headers]
      if server_version != API.api_version
        warn "BCS Firmware version (#{server_version}) does not match API version (#{API.api_version})."
      end
    end

  private

    def server_version
      @server_version ||= @headers["server"].sub(/\s+\(http:\/\/www\.embeddedcc\.com\)$/, '')
    end

  end
end; end
