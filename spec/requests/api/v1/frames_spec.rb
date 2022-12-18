# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::Frames", type: :request do
  include Dry::Monads::Result::Mixin

  let(:create_frame_url) { '/api/v1/frames' }
  let(:user) { create :user, role: "admin" }
  let(:headers) { { Authorization: user.api_token } }

  let(:valid_params) do
    {
      name: 'test name',
      description: 'test description',
      status: 'active',
      stock: 10,
      price: 100,
      currency_code: '840'
    }
  end.as_json

  let(:invalid_params) do
    {
      description: 'test description',
      price: 100,
      currency_code: '840'
    }
  end.as_json

  describe "POST /api/v1/frames" do
    describe 'when returns Success()' do
      before do
        post create_frame_url, params: params, headers: headers
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
        allow(Frames::Actions::CreateFrame).to receive(:call).and_return(Failure())
        post create_frame_url, params: params, headers: headers
      end

      describe 'when params valid' do
        let(:params) { valid_params }
          
        it 'returns 400' do
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    describe 'client can not create frames' do
      let(:user) { create :user, role: "client" }

      before do
        post create_frame_url, params: {}, headers: headers
      end

      it 'returns 403' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
