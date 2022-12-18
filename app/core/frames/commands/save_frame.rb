# frozen_string_literal: true

module Frames
  module Commands
    class SaveFrame
      include Dry::Monads[:result]

      attr_reader :params

      def self.call(**kwargs)
        new(**kwargs).call
      end

      def initialize(
        params:
      )
        @params = params
      end

      def call
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
