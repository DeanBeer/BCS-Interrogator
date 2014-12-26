describe NRB::BreweryControlSystem::HTTPService::UserAgent do

  let(:app) { :llama }
  let(:subject) { described_class.new app }

  it 'responds to :call' do
    expect(subject).to respond_to(:call).with(1).argument
  end

end
