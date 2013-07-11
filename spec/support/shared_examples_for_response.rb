shared_examples_for "a response" do |attr_names|

  it { expect( subject ).to be_an_instance_of Hash }
  it { expect( subject ).to include('requested') }

  (attr_names || []).each do |attr_name|
    it { expect( subject ).to include(attr_name) }
  end
end
