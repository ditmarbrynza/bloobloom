# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Glasses::Actions::CreateGlasses do
  include Dry::Monads::Result::Mixin

  let!(:currency) { create :currency }
  let!(:user) { create :user, role: "client", currency: currency }

  let(:params) do
    {
      frame_id: frame.id,
      lense_id: lense.id
    }
  end

  describe 'when frame and lense currency is similar to user' do
    let(:frame) { create :frame, currency: currency }
    let(:lense) { create :lense, currency: currency }

    it 'returns glasses price' do
      expect(described_class.call(params: params, user: user)).to eq(Success())
      frame_price = frame.price
      lense_price = lense.price
      glasses_price = (frame_price + lense_price) + ((frame_price + lense_price) * 0.45)
      glasses = user.glasses.first
      expect(glasses.price).to eq(glasses_price)
    end
  end

  describe 'when user has diffirent currency with frame and lense' do
    let!(:gbp) { create :currency, currency_name: 'GBP', currency_code: '826' }
    let!(:jod) { create :currency, currency_name: 'JOD', currency_code: '400' }
    
    let(:frame) { create :frame, currency: gbp }
    let(:lense) { create :lense, currency: jod }

    it 'returns glasses currency is similar to user currency' do
      expect(described_class.call(params: params, user: user)).to eq(Success())
      glasses = user.glasses.first
      expect(glasses.currency.currency_name).to eq(user.currency.currency_name)
      frame_price = frame.price * 0.3 + frame.price
      lense_price = lense.price * 0.3 + lense.price
      glasses_price = (frame_price + lense_price) + ((frame_price + lense_price) * 0.45)
      expect(glasses.price).to eq(glasses_price)
    end
  end
end
