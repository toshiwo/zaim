require 'faraday'
require 'faraday_middleware'

module Zaim
  module Request

    def get(path, params = {})
      request(:get, path, params)
    end
    private :get

    def post(path, params = {})
      request(:post, path, params)
    end
    private :post

    def request(method, path, params = {})
      response = connection.send(method) do |request|
        case method
        when :get, :delete
          request.url(path, params)
        when :post, :put
          request.path = path
          request.body = params unless params.empty?
        end
      end

      response.body
    end
    private :request

    def connection
      options = {
        :url => 'https://api.zaim.net',
      }

      Faraday.new(options) do |connection|
        connection.response :raise_error
        connection.response :json, :content_type => /\bjson$/
        connection.request :oauth, credentials
        connection.request :url_encoded
        connection.adapter Faraday.default_adapter
      end
    end
    private :connection

  end
end
