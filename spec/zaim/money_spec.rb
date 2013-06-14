require 'spec_helper'

describe Zaim::Money do

  let(:response_headers) { { content_type: 'application/json' } }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#money" do

    let(:request_url) { 'https://api.zaim.net/v2/home/money' }
    let(:response_body) { File.read('spec/fixtures/money.json') }

    before do
      stub_request( :get, request_url ).to_return( response )
    end

    subject { client.money }

    include_examples "a response"

    context "response 'money'" do

      subject { client.money.fetch 'money' }

      it { expect( subject ).to be_an_instance_of Array }

      %w( id type user_id date category_id genre_id to_account_id from_account_id amount comment place created currency_code ).each do |key_name|
        it { expect( subject.first ).to include(key_name) }
      end
    end
  end

end
