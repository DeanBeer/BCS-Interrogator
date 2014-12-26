require 'faraday'
describe NRB::BreweryControlSystem::API do

  let(:base_url) { 'http://localhost/' }
  let(:bcs) { NRB::BreweryControlSystem.new base_url: base_url }
  let(:subject) { described_class.new bcs: bcs }

  it 'has a http_service' do
    expect(subject.http_service).to be_a Faraday::Connection
  end

end
