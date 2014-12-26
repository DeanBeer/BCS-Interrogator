require 'faraday'
require 'support/null_app'
describe NRB::BreweryControlSystem::API::VersionCheck do

  let(:api_version) { 'spec' }
  let(:app) { NRB::BreweryControlSystem::NullApp.new }
  let(:remote_env) { { response_headers: { "server" => remote_server_version } } }
  let(:subject) { described_class.new app, api_version }

  it 'has a required_version' do
    expect(subject.required_version).to eq api_version
  end


  context 'with the correct remote version' do
    let(:remote_server_version) { api_version }
    it 'stays quiet' do
      expect(subject).not_to receive(:warn)
      subject.on_complete(remote_env)
    end
  end


  context 'with the incorrect remote version' do
    let(:remote_server_version) { '0.0.0.0' }
    it 'warns' do
      expect(subject).to receive(:warn).with("BCS Firmware version (#{remote_server_version}) does not match API version (#{api_version}).")
      subject.on_complete(remote_env)
    end
  end

end
