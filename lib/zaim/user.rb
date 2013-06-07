module Zaim
  module User

    def verify
      get('/v2/home/user/verify')
    end

  end
end
