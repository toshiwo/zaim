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

    def update type, id, params = {}
      unless check_resource_type type
        raise ArgumentError, "unknown type argument of '#{ type }'"
      end

      put("/v2/home/money/#{ type }/#{ id }", params)
    end

    def check_resource_type type
      %w( payment income transfer ).include? type.to_s
    end
    private :check_resource_type

  end
end
