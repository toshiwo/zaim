module Zaim
  module Genre

    def genre params = {}
      get('/v2/home/genre', params)
    end

  end
end
