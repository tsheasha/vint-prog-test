source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc


gem 'chronic_duration'
gem 'numerizer'
# Use Capistrano for deployment NOT used since not supported by Heroku
#gem 'capistrano-rails', group: :production

#Ruby API Builder Language
gem 'rabl'
gem 'oj'

group :development do
    gem 'heroku_san'
    #Automated tests for the rails app
    gem 'capybara'
    gem 'selenium-webdriver'
    gem 'sqlite3'
  end
group :production do
    #serve static files heroku
    gem 'rails_12factor'
    gem 'pg'
end
#unicorn server for production
gem 'unicorn'
#RSpec testing for Rails
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  #Generate instances of models for testing purposes
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end
#Ruby version
ruby "2.1.2"

