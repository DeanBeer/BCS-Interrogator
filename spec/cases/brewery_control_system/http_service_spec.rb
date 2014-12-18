require 'spec_helper'

describe NRB::BreweryControlSystem::HTTPService do

  let(:new_adapter) { :llama }

  it 'has a default adater' do
    expect(described_class.default_adapter).to_not be_nil
  end


  it 'responds to :default_adapter=' do
    expect(described_class).to respond_to(:default_adapter=)
  end


  it 'sets the default adapter' do
    old_adapter = described_class.default_adapter
    described_class.default_adapter = new_adapter
    expect(described_class.default_adapter).to eq new_adapter
    described_class.default_adapter = old_adapter
  end


  it 'has a default service' do
    expect(described_class.default_service).to be_a(Faraday::Connection)
  end

end
