# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Frames::Validations::ValidateCreationParams do
  include Dry::Monads::Result::Mixin

  describe 'when valid' do
    let(:currency) { create :currency }
    let(:params) do
      {
        name: 'test name',
        description: 'test description',
        status: Frame.statuses.first,
        stock: 10,
        price: 100,
        currency_code: currency.currency_code.to_s
      }
    end

    it 'returns Success()' do
      expect(described_class.call(params)).not_to eq(Failure())
    end
  end

  describe 'when frame statuses does not exist' do
    let(:currency) { create :currency }
    let(:params) do
      {
        name: 'test name',
        description: 'test description',
        status: 'fake status',
        stock: 10,
        price: 100,
        currency_code: currency.currency_code.to_s
      }
    end
    
    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:status_error)
    end
  end

  describe 'when currency does not exist' do
    let(:params) do
      {
        name: 'test name',
        description: 'test description',
        status: Frame.statuses.first,
        stock: 10,
        price: 100,
        currency_code: "202"
      }
    end
    
    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:currency_code_error)
    end
  end
end
