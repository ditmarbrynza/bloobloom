# frozen_string_literal: true

class Lense < ApplicationRecord
  enum prescription_type: { fashion: 1, single_vision: 2, varifocal: 3 }
  enum lens_type: { classic: 1, blue_light: 2, transition: 3 }

  belongs_to :currency, touch: true

  validates :color, :description, :prescription_type, :lens_type, :stock, :price, :currency_id, 
    presence: true
end
