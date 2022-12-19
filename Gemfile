source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'config', '~> 4.0'

gem 'active_model_serializers', '~> 0.10.2'
gem "dry-monads", "~> 1.4"
gem 'dry-validation', '~> 1.8'
gem 'faraday', '~> 1.8.0'
gem 'faraday_middleware', '~> 1.2.0'
gem 'oj', '~> 3.10.5'
gem "pundit", "~> 2.2"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'byebug', '~> 11.1.3'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry', '~> 0.13.0'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.1.1'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.21.0', require: false, group: :test
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'rubocop', '~> 1.16.0', require: false
  gem 'rubocop-performance', '~> 1.11.0', require: false
  gem 'rubocop-rails', '~> 2.10.0', require: false
  gem 'rubocop-rspec', '~> 2.3.0', require: false
end
