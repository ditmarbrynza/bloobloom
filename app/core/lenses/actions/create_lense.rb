# frozen_string_literal: true

module Lenses
  module Actions
    class CreateLense
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      attr_reader :params, :validate, :save_lense

      def self.call(**kwargs)
        new(**kwargs).call
      end

      def initialize(
        params:,
        validate: ::Lenses::Validations::ValidateCreationParams,
        save_lense: ::Lenses::Commands::SaveLense
      )
        @params = params
        @validate = validate
        @save_lense = save_lense
      end

      def call
        yield validate.call(params)
        yield save_lense.call(params: params)
        Success()
      end
    end
  end
end
