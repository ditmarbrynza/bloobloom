# frozen_string_literal: true

module Glasses
  module Contracts
    class CreateGlassesContract < Dry::Validation::Contract
      params do
        required(:frame_id).filled(:integer)
        required(:lense_id).filled(:integer)
      end
    end
  end
end
