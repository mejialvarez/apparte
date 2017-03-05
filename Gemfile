source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Generate fake data
gem 'faker', '~> 1.7', '>= 1.7.3'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'
# Allows you to generate your JSON in an object-oriented
gem 'active_model_serializers'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Framework test
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Fixtures for feeding test data
  gem 'factory_girl_rails', '~> 4.8'
  # Helps make sure each spec run in RSpec begins with a clean slate
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  # Making tests easy on the fingers and eyes
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
