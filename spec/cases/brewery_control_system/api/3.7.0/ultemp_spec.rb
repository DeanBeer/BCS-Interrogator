require 'spec_helper'
require 'faraday'
require 'brewery_control_system/api/3.7.0/endpoint'
require 'brewery_control_system/api/3.7.0/ultemp'
require 'shared_examples/3.7.0_endpoint'

describe NRB::BreweryControlSystem::API::Ultemp do

  let(:env) { { } }

  it_behaves_like :a_3_7_0_endpoint

end
