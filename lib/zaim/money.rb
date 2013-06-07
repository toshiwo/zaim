module Zaim
  module Money

    def money params = {}
      get('/v2/home/money', params)
    end

  end
end
