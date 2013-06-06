require 'spec_helper'

describe Zaim::Client do

  subject { Zaim::Client.new }

  it { expect( subject ).to be_an_instance_of Zaim::Client }
end
