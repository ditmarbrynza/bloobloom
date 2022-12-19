# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::Glasses", type: :request do
  include Dry::Monads::Result::Mixin

  let(:create_glasses_url) { '/api/v1/glasses' }
  let!(:currency) { create :currency }
  let!(:user) { create :user, role: "client", currency: currency }
  let!(:frame) { create :frame }
  let!(:lense) { create :lense }
  let(:headers) { { Authorization: user.api_token } }

  let(:invalid_params) do
    {
      frame_id: frame.id
    }
  end.as_json

  let(:valid_params) do 
    {
      frame_id: frame.id,
      lense_id: lense.id
    }
  end.as_json

  describe "POST /api/v1/glasses" do
    describe 'when returns Success()' do
      before do
        post create_glasses_url, params: params, headers: headers
      end

      describe 'when params valid' do
        let(:params) { valid_params }

        it 'returns 200' do
          expect(response).to have_http_status(:success)
        end
      end

      describe 'when params invalid' do
        let(:params) { invalid_params }

        it 'returns 200' do
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    describe 'when return Failure()' do
      before do
        allow(Glasses::Actions::CreateGlasses).to receive(:call).and_return(Failure())
        post create_glasses_url, params: params, headers: headers
      end

      describe 'when params valid' do
        let(:params) { valid_params }
          
        it 'returns 400' do
          expect(response).to have_http_status(:bad_request)
        end
      end
    end
  end
end
