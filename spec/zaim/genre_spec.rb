require 'spec_helper'

describe Zaim::Genre do

  let(:request_url) { 'https://api.zaim.net/v2/home/genre' }
  let(:response_headers) { { content_type: 'application/json' } }
  let(:response_body) { File.read('spec/fixtures/genre.json') }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#genre" do

    before do
      stub_request( :get, request_url ).to_return( response )
    end

    subject { client.genre }

    it { expect( subject ).to be_an_instance_of Hash }
    it { expect( subject ).to include('requested') }
    it { expect( subject ).to include('genres') }

    context "response 'genres'" do

      subject { client.genre.fetch 'genres' }

      it { expect( subject ).to be_an_instance_of Array }

      %w( id name mode sort parent_genre_id ).each do |key_name|
        it { expect( subject.first ).to include(key_name) }
      end
    end
  end

end
