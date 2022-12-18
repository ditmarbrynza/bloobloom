module Api
  module V1
    class LensesController < ApiController
      def index
        @lenses = Lense.all
        render json: @lenses, each_serializer: ::Api::V1::LensesSerializer
      end
      
      def create
        authorize Lense
        contract = ::Lenses::Contracts::CreateLenseContract.new.call(params['lense'].to_unsafe_hash)
        if contract.failure?
          return render json: { text: contract.errors.to_h }, status: :bad_request
        end
        result = ::Lenses::Actions::CreateLense.call(params: contract.to_h)
        if result.failure?
          render json: { text: result.failure }, status: :bad_request
        else
          render json: { text: :OK }, status: :ok
        end
      end
    end
  end
end
