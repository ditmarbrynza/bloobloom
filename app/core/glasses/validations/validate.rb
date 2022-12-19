# frozen_string_literal: true

module Glasses
  module Validations
    class Validate < ::Validations::Base
      attribute :frame_id, :integer
      attribute :lense_id, :integer

      validate :frames_enough?
      validate :lense_enough?

      private

      def frames_enough?
        frame = Frame.find_by(id: frame_id)
        unless frame
          errors.add(:frame_error, "Specified frame does't exists.")
        end
        
        return unless frame

        unless frame.stock > 1
          errors.add(:frame_out_of_stock_error, "Specified frame '#{frame.name}' is out of stock.")
        end
      end

      def lense_enough?
        lense = Lense.find_by(id: lense_id)
        unless lense
          errors.add(:lense_error, "Specified lense does't exists.")
        end
        
        return unless lense

        unless lense.stock > 1
          errors.add(:lense_out_of_stock_error, "Specified lense is out of stock.")
        end
      end
    end
  end
end
