require 'spec_helper'
require 'support/null_http_service'
describe NRB::BCSInterrogator::API do

  context 'class methods' do
    it 'has a version' do
      NRB::BCSInterrogator::API.should respond_to :api_version
    end
  end

  context :defaults do

    let(:api) { NRB::BCSInterrogator::API.new args }
    let(:args) { { base_url: base_url } }
    let(:base_url) { :blark }
    let(:http_service) { NRB::HTTPService }

    it 'has a default http_service' do
      api.http_service.should == http_service
    end


    it 'has an base_url reader' do
      api.base_url.should eq base_url
    end


    it 'has a sysname connector' do
      expect(api.sysname).to be_a NRB::BCSInterrogator::API::Sysname
    end


    it 'has a ultemp connector' do
      expect(api.ultemp).to be_a NRB::BCSInterrogator::API::Ultemp
    end

  end

  it 'blows up without a base_url' do
    expect { NRB::BCSInterrogator::API.new base_url: nil }.to raise_error(ArgumentError)
  end


  context 'making requests' do
    let(:api) { NRB::BCSInterrogator::API.new args }
    let(:api_call_args) { {} }
    let(:args) { { base_url: base_url, http_service: NRB::NullHTTPService  } }
    let(:base_url) { :blark }
    let(:body) { "" }
    let(:headers) { { "server" => 3 } }
    let(:response) { NRB::BCSInterrogator::API::Response.new body: body, headers: headers, status: status }

    before do
      # make api_call return response
    end

    context 'successful requests' do
      let(:status) { 200 }

      it 'returns a response' do
        expect ( api.api_call api_call_args ).to eq response
      end

    end

  end

end
