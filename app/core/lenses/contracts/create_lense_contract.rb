# frozen_string_literal: true

module Lenses
  module Contracts
    class CreateLenseContract < Dry::Validation::Contract
      params do
        required(:color).filled(:string)
        required(:description).filled(:string)
        required(:prescription_type).filled(:string)
        required(:lens_type).filled(:string)
        required(:stock).filled(:integer)
        required(:price).filled(:integer)
        required(:currency_code).filled(:string)
      end
    end
  end
end
