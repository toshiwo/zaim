module Zaim
  module Category

    def category params = {}
      get('/v2/home/category', params)
    end

  end
end
