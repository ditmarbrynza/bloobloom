# frozen_string_literal: true

class Glass < ApplicationRecord
  belongs_to :frame
  belongs_to :lense
  belongs_to :currency
  belongs_to :user

  validates :frame_id, :lense_id, :currency_id, :user_id, presence: true
end
