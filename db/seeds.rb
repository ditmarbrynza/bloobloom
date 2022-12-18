# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

currencies_data = [
  { currency_name: 'USD', currency_code: 840 },
  { currency_name: 'GBP', currency_code: 826 },
  { currency_name: 'EUR', currency_code: 978 },
  { currency_name: 'JOD', currency_code: 400 },
  { currency_name: 'JPY', currency_code: 392 }
]

Currency.create!(currencies_data)

User.create!(role: :admin, email: 'admin@gmail.com', currency: Currency.first, 
  api_token: SecureRandom.hex(15))
User.create!(role: :client, email: 'client@gmail.com', currency: Currency.last, 
  api_token: SecureRandom.hex(15))
