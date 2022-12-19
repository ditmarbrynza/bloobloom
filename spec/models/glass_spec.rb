require 'rails_helper'

RSpec.describe Glass, type: :model do
  it { is_expected.to validate_presence_of :frame_id }
  it { is_expected.to validate_presence_of :lense_id }
  it { is_expected.to validate_presence_of :currency_id }
  it { is_expected.to belong_to :frame }
  it { is_expected.to belong_to :lense }
  it { is_expected.to belong_to :currency }
end
