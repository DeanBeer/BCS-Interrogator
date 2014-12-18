require File.join File.dirname(__FILE__), "ultemp"
class NRB::BreweryControlSystem::API
  class Setpoints < Ultemp

    register_middleware middleware_options(self)

  private

    def parse
      setpoints
    end

  end
end
