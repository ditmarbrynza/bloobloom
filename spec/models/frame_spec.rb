# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Frame, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :status }
  it { is_expected.to validate_presence_of :stock }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :currency_id }
  it { is_expected.to belong_to :currency }
end
