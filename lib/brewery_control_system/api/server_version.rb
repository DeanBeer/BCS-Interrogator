class NRB::BreweryControlSystem::API
  module ServerVersion
    def server_version(headers)
      @server_version ||= headers["server"].sub(/^BCS\s+\/?(.+)\s+\(http:\/\/www\.embeddedcc\.com\)$/, '\1')
    end
  end
end
