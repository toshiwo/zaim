require 'spec_helper'

describe Zaim::Money do

  let(:response_headers) { { content_type: 'application/json' } }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#delete" do

    before do
      stub_request( :delete, request_url ).to_return( response )
    end

    context :unknown_type do

      let(:resource_id) { 10000 }
      let(:request_url) { 'http://example.com/' }
      let(:response_body) { }

      subject { client.delete :unknown_type, resource_id }

      it { expect { subject }.to raise_error(ArgumentError) }
    end

    context :payment do

      let(:resource_id) { 10002 }
      let(:request_url) { "https://api.zaim.net/v2/home/money/payment/#{ resource_id }" }
      let(:response_body) { File.read('spec/fixtures/money/payment.json') }

      subject { client.delete :payment, resource_id }

      it { expect( subject ).to be_an_instance_of Hash }
      it { expect( subject ).to include('requested') }
      it { expect( subject ).to include('money') }
      it { expect( subject ).to include('user') }
    end

    context :income do

      let(:resource_id) { 11002 }
      let(:request_url) { "https://api.zaim.net/v2/home/money/income/#{ resource_id }" }
      let(:response_body) { File.read('spec/fixtures/money/income.json') }

      subject { client.delete :income, resource_id }

      it { expect( subject ).to be_an_instance_of Hash }
      it { expect( subject ).to include('requested') }
      it { expect( subject ).to include('money') }
      it { expect( subject ).to include('user') }
    end

    context :transfer do

      let(:resource_id) { 12002 }
      let(:request_url) { "https://api.zaim.net/v2/home/money/transfer/#{ resource_id }" }
      let(:response_body) { File.read('spec/fixtures/money/transfer.json') }

      subject { client.delete :transfer, resource_id }

      it { expect( subject ).to be_an_instance_of Hash }
      it { expect( subject ).to include('requested') }
      it { expect( subject ).to include('money') }
      it { expect( subject ).to include('user') }
    end
  end

end
