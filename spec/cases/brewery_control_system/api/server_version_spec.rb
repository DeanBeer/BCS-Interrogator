require 'spec_helper'

module NRB; module Fake
  class SomeClass
    include NRB::BreweryControlSystem::API::ServerVersion
  end
end; end

describe NRB::BreweryControlSystem::API::ServerVersion do

  let(:headers) { { 'server' => server } }
  let(:subject) { NRB::Fake::SomeClass.new }
  let(:server) { "BCS #{version} (http://www.embeddedcc.com)" }
  let(:version) { "spec" }

  it 'responds_to :server_version' do
    expect(subject).to respond_to :server_version
  end


  it 'strips out everything except the version' do
    expect(subject.server_version(headers)).to eq version
  end

end
