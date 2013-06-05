require 'spec_helper'

describe Zaim do
  it 'should have a version number' do
    Zaim::VERSION.should_not be_nil
  end

  describe ".configure" do

    [ :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret ].each do |attr_name|

      context "set #{ attr_name }"do

        before do
          Zaim.configure do |config|
            config.send("#{ attr_name }=", attr_name)
          end
        end

        subject(:attribute) { Zaim.instance_variable_get(:"@#{ attr_name }") }

        it { expect(attribute).to eq attr_name }
      end
    end
  end

end
