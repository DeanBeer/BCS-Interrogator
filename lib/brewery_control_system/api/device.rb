class NRB::BreweryControlSystem::API
  class Device < Struct.new(:name, :type, :version, :build)
    # build    string
    # name     string
    # type     string
    # version  string
  end
end
