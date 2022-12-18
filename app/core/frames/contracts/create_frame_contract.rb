# frozen_string_literal: true

module Frames
  module Contracts
    class CreateFrameContract < Dry::Validation::Contract
      params do
        required(:name).filled(:string)
        required(:description).filled(:string)
        required(:status).filled(:string)
        required(:stock).filled(:integer)
        required(:price).filled(:integer)
        required(:currency_code).filled(:string)
      end
    end
  end
end
