# frozen_string_literal: true

module Frames
  module Actions
    class CreateFrame
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      attr_reader :params, :validate, :save_frame

      def self.call(**kwargs)
        new(**kwargs).call
      end

      def initialize(
        params:,
        validate: ::Frames::Validations::ValidateCreationParams,
        save_frame: ::Frames::Commands::SaveFrame
      )
        @params = params
        @validate = validate
        @save_frame = save_frame
      end

      def call
        yield validate.call(params)
        yield save_frame.call(params: params)
        Success()
      end
    end
  end
end
