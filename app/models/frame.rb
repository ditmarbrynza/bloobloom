# frozen_string_literal: true

class Frame < ApplicationRecord
  enum status: { inactive: 0, active: 1 }

  belongs_to :currency
  
  validates :name, :description, :status, :stock, :price, :currency_id, presence: true
end
