# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::ShoppingBasket", type: :request do
  include Dry::Monads::Result::Mixin

  let(:shopping_basket_url) { '/api/v1/shopping_basket' }
  let!(:currency) { create :currency }
  let!(:user) { create :user, role: "client", currency: currency }
  let(:headers) { { Authorization: user.api_token } }

  let!(:frame) { create :frame }
  let!(:lense) { create :lense }
  let!(:glasses) { create :glass, frame: frame, lense: lense, user: user, currency: currency }

  describe "GET /api/v1/shopping_basket" do
    before do
      get shopping_basket_url, headers: headers
    end

    it 'returns shopping basket' do
      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)["glasses"].first.symbolize_keys
      expect(body).to have_key(:frame_name)
      expect(body).to have_key(:lense_color)
      expect(body).to have_key(:lense_type)
      expect(body).to have_key(:lense_prescription_type)
      expect(body).to have_key(:price)
      expect(body).to have_key(:currency_name)
      expect(body).to have_key(:created_at)
      expect(body).to have_key(:updated_at)
    end
  end
end
