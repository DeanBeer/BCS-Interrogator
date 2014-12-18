require 'spec_helper'

describe NRB::BreweryControlSystem::TemperatureProbe do

  it 'responds to :coefficients' do
    expect(subject).to respond_to(:coefficients)
  end


  it 'responds to :enabled' do
    expect(subject).to respond_to(:enabled)
  end


  it 'responds to :name' do
    expect(subject).to respond_to(:name)
  end


  it 'responds to :resistance' do
    expect(subject).to respond_to(:resistance)
  end


  it 'responds to :setpoint' do
    expect(subject).to respond_to(:setpoint)
  end


  it 'responds to :temp' do
    expect(subject).to respond_to(:temp)
  end

end
