describe NRB::BreweryControlSystem::Input do

  it 'responds to :id' do
    expect(subject).to respond_to(:id)
  end


  it 'responds to :name' do
    expect(subject).to respond_to(:name)
  end


  it 'responds to :state' do
    expect(subject).to respond_to(:state)
  end

end
