FactoryBot.define do
  factory :lense do
    color { 'blue' }
    description { 'test description' }
    prescription_type { :fashion }
    lens_type { :classic }
    stock { 10 }
    price { 40 }
    currency { Currency.first || create(:currency) }
  end
end
