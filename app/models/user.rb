# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { admin: 1, client: 2 }

  belongs_to :currency
  has_many :glasses, dependent: :destroy

  validates :email, :role, :currency_id, presence: true
end
