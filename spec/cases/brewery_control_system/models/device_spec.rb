require 'spec_helper'

describe NRB::BreweryControlSystem::Device do

  it 'responds to :build' do
    expect(subject).to respond_to(:build)
  end


  it 'responds to :name' do
    expect(subject).to respond_to(:name)
  end


  it 'responds to :type' do
    expect(subject).to respond_to(:type)
  end


  it 'responds to :version' do
    expect(subject).to respond_to(:version)
  end

end
