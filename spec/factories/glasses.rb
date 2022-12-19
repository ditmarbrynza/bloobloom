FactoryBot.define do
  factory :glass do
    frame { Frame.first || create(:frame) }
    lense { Lense.first || create(:lense) }
    user { User.first || create(:user) }
    price { 150 }
    currency { Currency.first || create(:currency) }
  end
end
