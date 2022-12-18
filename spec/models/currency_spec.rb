# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Currency, type: :model do
  it { is_expected.to validate_presence_of :currency_name }
  it { is_expected.to validate_presence_of :currency_code }
end
