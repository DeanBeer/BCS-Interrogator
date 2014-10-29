module NRB; class BreweryControlSystem
  class HTTPService::UserAgent

    NAME = 'BCS Interrogator'.freeze
    URL = 'https://github.com/NewRepublicBrewing/BCS-Interrogator'.freeze


    def agent
      @agent ||= "#{name} #{version} (#{url})".freeze
    end


    def call(env)
      env[:request_headers]["User-Agent"] = agent
      @app.call(env).on_complete { }
    end


    def initialize(app)
      @app = app
    end


    def name; NAME; end


    def url; URL; end


    def version; NRB::BreweryControlSystem.version; end

  end
end; end
