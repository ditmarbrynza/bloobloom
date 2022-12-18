# frozen_string_literal: true

module Frames
  module Actions
    class CreateFrame
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      attr_reader :params, :validate

      def self.call(**kwargs)
        new(**kwargs).call
      end

      def initialize(
        params:,
        validate: ::Frames::Validations::ValidateCreationParams
      )
        @params = params
        @validate = validate
      end

      def call
        yield validate.call(params)
        params[:currency_id] = Currency.find_by(currency_code: params[:currency_code]).id
        params.delete(:currency_code)
        Frame.create!(params)
        Success()
      rescue StandardError => e
        Rails.logger.error("[#{self.class}] error #{e}")
        Failure({ error: e })
      end
    end
  end
end
