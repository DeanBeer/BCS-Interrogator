require File.join File.dirname(__FILE__), "ultemp"
class NRB::BreweryControlSystem::API
  class Temps < Ultemp

    register_middleware middleware_options(self)

  private

    def parse
      return if body_array.nil?
      temps
    end

  end
end
