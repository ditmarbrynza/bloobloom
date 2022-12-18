# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    role { "client" }
    currency { Currency.first || create(:currency) }
    api_token { SecureRandom.hex(15) }
  end
end
