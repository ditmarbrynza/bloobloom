# frozen_string_literal: true

class Currency < ApplicationRecord
  validates :currency_name, :currency_code, presence: true
end
