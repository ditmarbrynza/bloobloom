module Api
  module V1
    class GlassesController < ApiController
      def create
        contract = ::Glasses::Contracts::CreateGlassesContract.new.call(params.to_unsafe_hash)
        if contract.failure?
          return render json: { text: contract.errors.to_h }, status: :bad_request
        end
        result = ::Glasses::Actions::CreateGlasses.call(params: contract.to_h, user: @current_user)
        if result.failure?
          render json: { text: result.failure }, status: :bad_request
        else
          render json: { text: :OK }, status: :ok
        end
      end
    end
  end
end
