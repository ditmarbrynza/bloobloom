# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Glasses::Validations::Validate do
  include Dry::Monads::Result::Mixin

  let!(:currency) { create :currency }
  let!(:user) { create :user, role: "client", currency: currency }

  let(:params) do 
    {
      frame_id: frame.id,
      lense_id: lense.id
    }
  end

  describe 'when frame and lense are enought' do
    let(:frame) { create :frame }
    let(:lense) { create :lense }

    it 'returns Success()' do
      expect(described_class.call(params)).not_to eq(Failure())
    end
  end

  describe 'when frame is out of stock' do
    let(:frame) { create :frame, stock: 0 }
    let(:lense) { create :lense, stock: 10 }

    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:frame_out_of_stock_error)
    end
  end

  describe 'when lense is out of stock' do
    let(:frame) { create :frame, stock: 10 }
    let(:lense) { create :lense, stock: 0 }

    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:lense_out_of_stock_error)
    end
  end

  describe 'when frame and lense are out of stock' do
    let(:frame) { create :frame, stock: 0 }
    let(:lense) { create :lense, stock: 0 }

    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:frame_out_of_stock_error)
      expect(described_class.call(params).failure).to have_key(:lense_out_of_stock_error)
    end
  end
end 
