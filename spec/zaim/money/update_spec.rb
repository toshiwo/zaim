require 'spec_helper'

describe Zaim::Money do

  let(:resource_id) { 10002 }
  let(:response_headers) { { content_type: 'application/json' } }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#update" do

    before do
      stub_request( :put, request_url ).to_return( response )
    end

    context :unknown_type do

      let(:resource_id) { 10000 }
      let(:request_url) { "http://example.com" }
      let(:response_body) { }

      let(:params) { { } }

      subject { client.update :unknown_type, resource_id, params }

      it { expect { subject }.to raise_error ArgumentError }
    end

    context :payment do

      let(:resource_id) { 10002 }
      let(:request_url) { "https://api.zaim.net/v2/home/money/payment/#{ resource_id }" }
      let(:response_body) { File.read('spec/fixtures/money/payment.json') }

      let(:params) { {
          amount: 2000,
          date: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
        } }

      subject { client.update :payment, resource_id, params }

      include_examples "a response", [ 'money', 'user' ]
    end

    context :income do

      let(:resource_id) { 11002 }
      let(:request_url) { "https://api.zaim.net/v2/home/money/income/#{ resource_id }" }
      let(:response_body) { File.read('spec/fixtures/money/payment.json') }

      let(:params) { {
          amount: 10000,
          date: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
        } }

      subject { client.update :income, resource_id, params }

      include_examples "a response", [ 'money', 'user' ]
    end

    context :transfer do

      let(:resource_id) { 12002 }
      let(:request_url) { "https://api.zaim.net/v2/home/money/transfer/#{ resource_id }" }
      let(:response_body) { File.read('spec/fixtures/money/transfer.json') }

      subject { client.update :transfer, resource_id }

      include_examples "a response", [ 'money', 'user' ]
    end
  end

end
