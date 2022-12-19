# frozen_string_literal: true

module Lenses
  module Validations
    class ValidateCreationParams < ::Validations::Base
      attribute :color, :string
      attribute :description, :string
      attribute :prescription_type, :string
      attribute :lens_type, :string
      attribute :stock, :integer
      attribute :price, :integer
      attribute :currency_code, :string

      validate :prescription_type?
      validate :lens_type?
      validate :currency_code?

      private

      def prescription_type?
        unless Lense.prescription_types.key?(prescription_type)
          errors.add(:prescription_type_error, "Specified prescription_type does't exists.")
        end
      end

      def lens_type?
        unless Lense.lens_types.key?(lens_type)
          errors.add(:lens_type_error, "Specified lens_type does't exists.")
        end
      end

      def currency_code?
        unless Currency.exists?(currency_code: currency_code)
          errors.add(:currency_code_error, "Specified currency_code does't exists.")
        end
      end
    end
  end
end
