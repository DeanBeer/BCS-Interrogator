shared_examples_for :a_3_7_0_endpoint do

  it 'has an endpoint' do
    expect(described_class.endpoint).to be_a String
  end


  it 'does not raise error on parse' do
    expect { subject.on_complete(env) }.not_to raise_error
  end

end
