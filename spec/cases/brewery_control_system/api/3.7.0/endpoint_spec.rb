require 'faraday'
require 'spec_helper'
require 'brewery_control_system/api/3.7.0/endpoint'

describe NRB::BreweryControlSystem::API::Endpoint do

  let(:env) { { } }

  it 'requires subclasses to implement parse' do
    expect { subject.on_complete(env) }.to raise_error(RuntimeError)
  end

end
