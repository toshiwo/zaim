require 'spec_helper'

describe Zaim::Category do

  let(:request_url) { 'https://api.zaim.net/v2/home/category' }
  let(:response_headers) { { content_type: 'application/json' } }
  let(:response_body) { File.read('spec/fixtures/category.json') }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#category" do

    before do
      stub_request( :get, request_url ).to_return( response )
    end

    subject { client.category }

    include_examples "a response", [ 'categories' ]

    context "response 'categories'" do

      subject { client.category.fetch 'categories' }

      it { expect( subject ).to be_an_instance_of Array }

      %w( id name mode sort parent_category_id ).each do |key_name|
        it { expect( subject.first ).to include(key_name) }
      end
    end
  end

end
