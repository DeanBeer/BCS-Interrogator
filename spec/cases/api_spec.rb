require 'spec_helper'

describe NRB::BCSInterrogator::API do

  context 'class methods' do
    it 'has a version' do
      NRB::BCSInterrogator::API.should respond_to :api_version
    end
  end

  context 'defaults' do

    let(:api) { NRB::BCSInterrogator::API.new args }
    let(:args) { { base_url: base_url } }
    let(:base_url) { '' }
    let(:http_service) { NRB::HTTPService }

    it 'has a default http_service' do
      api.http_service.should == http_service
    end

    it 'has an base_url reader' do
      api.base_url.should eq base_url
    end

  end

  it 'blows up without a base_url' do
    expect { NRB::BCSInterrogator::API.new }.to raise_error(ArgumentError)
  end


end
