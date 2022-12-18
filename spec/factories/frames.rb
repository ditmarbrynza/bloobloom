FactoryBot.define do
  factory :frame do
    name { 'test name' }
    description { 'test description' }
    status { :active } 
    stock { 10 }
    price { 100 }
    currency { Currency.first || create(:currency) }

    trait :inactive do
      status { :inactive } 
    end
  end
end
