module Zaim
  module Configuration

    OptionKeys = [ :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret ]

    attr_writer :consumer_secret, :oauth_token, :oauth_token_secret
    attr_accessor :consumer_key

    def configure
      yield self
      self
    end

    def credentials
      {
        :consumer_key    => @consumer_key,
        :consumer_secret => @consumer_secret,
        :token           => @oauth_token,
        :token_secret    => @oauth_token_secret,
      }
    end
    private :credentials

  end
end
