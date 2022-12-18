# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lenses::Actions::CreateLense do
  include Dry::Monads::Result::Mixin

  let(:user) { create :user, role: :admin }

  let(:params) do
    {
      color: 'test',
      description: 'test description',
      prescription_type: 'fashion', 
      lens_type: 'classic',
      stock: 10,
      price: 40
    }
  end
  
  let(:usd_code) { '840' }
  let(:gbp_code) { '826' }
  let(:eur_code) { '978' }
  let(:jod_code) { '400' }
  let(:jpy_code) { '392' }

  before do
    create :currency, currency_name: 'USD', currency_code: usd_code
    create :currency, currency_name: 'GBP', currency_code: gbp_code
    create :currency, currency_name: 'EUR', currency_code: eur_code
    create :currency, currency_name: 'JOD', currency_code: jod_code
    create :currency, currency_name: 'JPY', currency_code: jpy_code
  end

  describe 'admin can create lenses with different currencies' do
    it 'create frame with usd' do
      payload = params.merge({ currency_code: usd_code })
      expect(described_class.call(params: payload)).to eq(Success())
    end

    it 'create frame with gbp' do
      payload = params.merge({ currency_code: gbp_code })
      expect(described_class.call(params: payload)).to eq(Success())
    end

    it 'create frame with eur' do
      payload = params.merge({ currency_code: eur_code })
      expect(described_class.call(params: payload)).to eq(Success())
    end

    it 'create frame with jod' do
      payload = params.merge({ currency_code: jod_code })
      expect(described_class.call(params: payload)).to eq(Success())
    end

    it 'create frame with jpy' do
      payload = params.merge({ currency_code: jpy_code })
      expect(described_class.call(params: payload)).to eq(Success())
    end
  end
end
