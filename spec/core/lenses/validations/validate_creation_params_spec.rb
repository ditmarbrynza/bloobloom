# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lenses::Validations::ValidateCreationParams do
  include Dry::Monads::Result::Mixin

  describe 'when valid' do
    let(:currency) { create :currency }
    let(:params) do
      {
        color: 'test',
        description: 'test description',
        prescription_type: Lense.prescription_types.first, 
        lens_type: Lense.lens_types.first,
        stock: 10,
        price: 40,
        currency_code: currency.currency_code.to_s
      }
    end

    it 'returns Success()' do
      expect(described_class.call(params)).not_to eq(Failure())
    end
  end

  describe 'when prescription_type does not exist' do
    let(:currency) { create :currency }

    let(:params) do
      {
        color: 'test',
        description: 'test description',
        prescription_type: "fake prescription_type", 
        lens_type: Lense.lens_types.first,
        stock: 10,
        price: 40,
        currency_code: currency.currency_code.to_s
      }
    end
    
    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:prescription_type_error)
    end
  end

  describe 'when lens_type does not exist' do
    let(:currency) { create :currency }

    let(:params) do
      {
        color: 'test',
        description: 'test description',
        prescription_type: Lense.prescription_types.first, 
        lens_type: "fake lens_type",
        stock: 10,
        price: 40,
        currency_code: currency.currency_code.to_s
      }
    end
    
    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:lens_type_error)
    end
  end

  describe 'when currency does not exist' do
    let(:params) do
      {
        color: 'test',
        description: 'test description',
        prescription_type: Lense.prescription_types.first, 
        lens_type: Lense.lens_types.first,
        stock: 10,
        price: 40,
        currency_code: "202"
      }
    end
    
    it 'returns Failure()' do
      expect(described_class.call(params).failure).to have_key(:currency_code_error)
    end
  end
end
