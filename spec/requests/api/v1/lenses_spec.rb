# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::Lenses", type: :request do
  include Dry::Monads::Result::Mixin

  let(:create_lense_url) { '/api/v1/lenses' }
  let(:user) { create :user, role: "admin" }
  let(:headers) { { Authorization: user.api_token } }

  let(:invalid_params) do
    {
      description: 'test description',
      price: 100,
      currency_code: '840'
    }
  end.as_json

  let(:valid_params) do 
    {
      color: 'test',
      description: 'test description',
      prescription_type: 'fashion', 
      lens_type: 'classic',
      stock: 10,
      price: 40,
      currency_code: '840'
    }
  end.as_json

  describe "POST /api/v1/lenses" do
    describe 'when returns Success()' do
      before do
        post create_lense_url, params: params, headers: headers
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
        allow(Lenses::Actions::CreateLense).to receive(:call).and_return(Failure())
        post create_lense_url, params: params, headers: headers
      end

      describe 'when params valid' do
        let(:params) { valid_params }

        it 'returns 200' do
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    describe 'client can not create lenses' do
      let(:user) { create :user, role: "client" }

      before do
        post create_lense_url, params: {}, headers: headers
      end

      it 'returns 403' do
        expect(response).to have_http_status(:forbidden)
      end
    end

    describe "GET /api/v1/lenses" do
      let(:user) { create :user, role: "client" }
      let(:frames_url) { '/api/v1/lenses' }
      let(:number_of_elements) { 3 }

      before do
        create_list :lense, number_of_elements
        get frames_url
      end
  
      it 'return only active lenses' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)["lenses"].count).to eq(number_of_elements)
      end
    end
  end
end
