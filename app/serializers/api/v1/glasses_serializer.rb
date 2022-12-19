# frozen_string_literal: true

module Api
  module V1
    class GlassesSerializer < ActiveModel::Serializer
      attributes %i[id frame_name lense_color lense_type lense_prescription_type price 
        currency_name created_at updated_at]

      def currency_name
        object.currency.currency_name
      end

      def frame_name
        object.frame.name
      end

      def lense_color
        object.lense.color
      end

      def lense_type
        object.lense.lens_type
      end

      def lense_prescription_type
        object.lense.prescription_type
      end
    end
  end
end  
