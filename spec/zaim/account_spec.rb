require 'spec_helper'

describe Zaim::Account do

  let(:request_url) { 'https://api.zaim.net/v2/home/account' }
  let(:response_headers) { { content_type: 'application/json' } }
  let(:response_body) { File.read('spec/fixtures/account.json') }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#account" do

    before do
      stub_request( :get, request_url ).to_return( response )
    end

    subject { client.account }

    include_examples "a response", [ 'accounts' ]

    context "response 'accounts'" do

      subject { client.account.fetch 'accounts' }

      it { expect( subject ).to be_an_instance_of Array }

      %w( id name color icon_url ).each do |key_name|
        it { expect( subject.first ).to include(key_name) }
      end
    end
  end

end
