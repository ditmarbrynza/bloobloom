# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LensesController, type: :controller do
  describe 'api_token does not exist' do
    let(:user) { create :user, role: "client" }

    before do
      post :create, params: {}
    end

    it 'returns 403' do
      expect(response).to have_http_status(:forbidden)
    end
  end
end
