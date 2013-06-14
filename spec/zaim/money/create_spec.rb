require 'spec_helper'

describe Zaim::Money do

  let(:response_headers) { { content_type: 'application/json' } }
  let(:response) { { body: response_body, status: 200, headers: response_headers } }
  let(:client) { Zaim::Client.new }

  describe "#payment" do

    let(:request_url) { 'https://api.zaim.net/v2/home/money/payment' }
    let(:response_body) { File.read('spec/fixtures/money/payment.json') }

    let(:params) { {
        category_id: 100,
        genre_id: 100,
        amount: 1000,
        date: "2011-11-07 01:23:45"
      } }

    before do
      stub_request( :post, request_url ).to_return( response )
    end

    subject { client.payment params }

    it { expect( subject ).to be_an_instance_of Hash }
    it { expect( subject ).to include('requested') }
    it { expect( subject ).to include('money') }
    it { expect( subject ).to include('user') }
  end

  describe "#income" do

    let(:request_url) { 'https://api.zaim.net/v2/home/money/income' }
    let(:response_body) { File.read('spec/fixtures/money/income.json') }

    let(:params) { {
        category_id: 100,
        amount: 1000,
        date: "2011-11-07 01:23:45"
      } }

    before do
      stub_request( :post, request_url ).to_return( response )
    end

    subject { client.income params }

    it { expect( subject ).to be_an_instance_of Hash }
    it { expect( subject ).to include('requested') }
    it { expect( subject ).to include('money') }
    it { expect( subject ).to include('user') }
  end

  describe "#transfer" do

    let(:request_url) { 'https://api.zaim.net/v2/home/money/transfer' }
    let(:response_body) { File.read('spec/fixtures/money/transfer.json') }

    let(:params) { {
        category_id: 100,
        amount: 1000,
        date: "2011-11-07 01:23:45"
      } }

    before do
      stub_request( :post, request_url ).to_return( response )
    end

    subject { client.transfer params }

    it { expect( subject ).to be_an_instance_of Hash }
    it { expect( subject ).to include('requested') }
    it { expect( subject ).to include('money') }
    it { expect( subject ).to include('user') }
  end

end
