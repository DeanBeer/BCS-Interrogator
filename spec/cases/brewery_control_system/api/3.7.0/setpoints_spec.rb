require 'faraday'
require 'brewery_control_system/api/3.7.0/endpoint'
require 'brewery_control_system/api/3.7.0/setpoints'
require 'shared_examples/3.7.0_endpoint'

describe NRB::BreweryControlSystem::API::Setpoints do

  let(:env) { { } }

  it_behaves_like :a_3_7_0_endpoint

end
