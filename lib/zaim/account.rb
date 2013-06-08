module Zaim
  module Account

    def account params = {}
      get('/v2/home/account', params)
    end

  end
end
