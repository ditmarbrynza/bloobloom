module Api
  module V1
    class ShoppingBasketController < ApiController
      def index
        @glasses = Glass.where(user_id: @current_user.id)
        render json: @glasses, each_serializer: ::Api::V1::GlassesSerializer
      end
    end
  end
end
