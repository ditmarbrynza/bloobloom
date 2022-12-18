module Api
  module V1
    class FramesController < ApiController
      def index
        @frames = Frame.where(status: :active)
        render json: @frames, each_serializer: ::Api::V1::FramesSerializer
      end

      def create
        authorize Frame
        contract = ::Frames::Contracts::CreateFrameContract.new.call(params['frame'].to_unsafe_hash)
        if contract.failure?
          return render json: { text: contract.errors.to_h }, status: :bad_request
        end
        result = ::Frames::Actions::CreateFrame.call(params: contract.to_h)
        if result.failure?
          render json: { text: result.failure }, status: :bad_request
        else
          render json: { text: :OK }, status: :ok
        end
      end
    end
  end
end
