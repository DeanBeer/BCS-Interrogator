class NRB::BreweryControlSystem
  class TemperatureProbe < Struct.new(:name, :temp, :setpoint, :resistance, :enabled, :coefficients)
  end
end
