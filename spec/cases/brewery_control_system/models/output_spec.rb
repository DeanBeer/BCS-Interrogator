describe NRB::BreweryControlSystem::Output do

  it 'responds to :enabled' do
    expect(subject).to respond_to(:enabled)
  end


  it 'responds to :name' do
    expect(subject).to respond_to(:name)
  end


  it 'responds to :on' do
    expect(subject).to respond_to(:on)
  end

end
