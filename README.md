# Zaim

A Ruby wrapper for the Zaim API.

## Installation

Add this line to your application's Gemfile:

    gem 'zaim'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zaim

## Usage

### Setup

```ruby
Zaim.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = OUR_CONSUMER_SECRET
  config.oauth_token = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end
```

```ruby
client = Zaim::Client.new

client.verify
{"me"=>{"login"=>"....."}, "requested"=>1370894199}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
