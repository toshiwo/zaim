module Zaim
  module Money

    def money params = {}
      get('/v2/home/money', params)
    end

    def payment params
      post('/v2/home/money/payment', params)
    end

    def income params
      post('/v2/home/money/income', params)
    end

    def transfer params
      post('/v2/home/money/transfer', params)
    end

  end
end
