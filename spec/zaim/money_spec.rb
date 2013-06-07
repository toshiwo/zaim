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

    it { expect( subject ).to be_an_instance_of Hash }
    it { expect( subject ).to include('requested') }
    it { expect( subject ).to include('money') }

    context "response 'money'" do

      subject { client.money.fetch 'money' }

      it { expect( subject ).to be_an_instance_of Array }

      %w( id type user_id date category_id genre_id to_account_id from_account_id amount comment place created currency_code ).each do |key_name|
        it { expect( subject.first ).to include(key_name) }
      end
    end
  end

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

end
