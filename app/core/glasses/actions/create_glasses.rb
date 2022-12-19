# frozen_string_literal: true

module Glasses
  module Actions
    class CreateGlasses
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      WORK_RATE = 0.45
      FAKE_CURRENCY_CONVERTER_RATE = 0.3

      attr_reader :params, :user, :validate, :frame, :lense

      def self.call(**kwargs)
        new(**kwargs).call
      end

      def initialize(
        params:,
        user:,
        validate: ::Glasses::Validations::Validate
      )
        @params = params
        @user = user
        @validate = validate
      end

      def call
        result = validate.call(params)
        return result if result.failure?

        glass_params = build_glasses_params
        Glass.create!(glass_params)
        substract_details
        Success()
      rescue StandardError => e
        Rails.logger.error("[#{self.class}] error #{e}")
        Failure({ error: e })
      end

      private

      def build_glasses_params
        params.merge({ currency_id: user.currency_id, price: price, user_id: user.id })
      end

      def price
        @frame = Frame.find_by(id: params[:frame_id])
        @lense = Lense.find_by(id: params[:lense_id])
        glasses_currency_name = user.currency.currency_name
        frame_currency_name = frame.currency.currency_name
        lense_currency_name = lense.currency.currency_name

        frame_price = if glasses_currency_name != frame_currency_name
          convert_currency(frame_currency_name, glasses_currency_name, frame.price)
        end
        
        lense_price = if glasses_currency_name != lense_currency_name
          convert_currency(lense_currency_name, glasses_currency_name, lense.price)
        end

        frame_price ||= frame.price
        lense_price ||= lense.price

        frame_and_lense_prices_function(frame_price, lense_price)
      end

      def convert_currency(_from, _to, amount)
        ### mocked logic to external service for convertations
        fake_converter_function(amount)
      end

      def frame_and_lense_prices_function(frame_price, lense_price)
        (frame_price + lense_price) + ((frame_price + lense_price) * WORK_RATE)
      end

      def substract_details
        frame.update(stock: frame.stock - 1)
        lense.update(stock: lense.stock - 1)
      end

      def fake_converter_function(amount)
        amount * FAKE_CURRENCY_CONVERTER_RATE + amount
      end
    end
  end
end
