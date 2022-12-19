module Api
  module V1
    class ShoppingBasketController < ApiController
      def index
        @glasses = Glass.all
        render json: @glasses, each_serializer: ::Api::V1::GlassesSerializer
      end
    end
  end
end
