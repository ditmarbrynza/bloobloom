# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :role }
  it { is_expected.to validate_presence_of :currency_id }
  it { is_expected.to belong_to :currency }
  it { is_expected.to have_many :glasses }
end
