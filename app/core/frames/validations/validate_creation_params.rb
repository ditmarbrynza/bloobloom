# frozen_string_literal: true

module Frames
  module Validations
    class ValidateCreationParams < ::Validations::Base
      attribute :name, :string
      attribute :description, :string
      attribute :status, :string
      attribute :stock, :integer
      attribute :price, :integer
      attribute :currency_code, :string

      validate :status?
      validate :currency_code?

      private

      def status?
        unless Frame.statuses.key?(status)
          errors.add(:status, "Specified status does't exists.")
        end
      end

      def currency_code?
        unless Currency.exists?(currency_code: currency_code)
          errors.add(:currency_code, "Specified currency_code does't exists.")
        end
      end
    end
  end
end
