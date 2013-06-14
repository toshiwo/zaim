require 'spec_helper'

describe Zaim::User do

  let(:request_url) { 'https://api.zaim.net/v2/home/user/verify' }
  let(:response_headers) { { content_type: 'application/json' } }
  let(:response_body) { File.read('spec/fixtures/user/verify.json') }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#verify" do

    before do
      stub_request( :get, request_url ).to_return( response )
    end

    subject { client.verify }

    include_examples "a response", [ 'me' ]

    context "response 'me'" do

      %w( id login name input_count day_count repeat_count day week month currency_code ).each do |key_name|
        it { expect( subject.fetch 'me' ).to include(key_name) }
      end
    end
  end

end
