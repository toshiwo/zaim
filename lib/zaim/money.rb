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

    def update_payment id, params
      update :payment, id, params
    end

    def update_income id, params
      update :income, id, params
    end

    def update_transfer id, params
      update :transfer, id, params
    end

    def delete type, id #, params = {} # TODO:
      unless check_resource_type type
        raise ArgumentError, "unknown type argument of '#{ type }'"
      end

      request(:delete, "/v2/home/money/#{ type }/#{ id }")
    end

    def delete_payment id
      delete :payment, id
    end

    def delete_income id
      delete :income, id
    end

    def delete_transfer id
      delete :transfer, id
    end

    def check_resource_type type
      %w( payment income transfer ).include? type.to_s
    end
    private :check_resource_type

  end
end
