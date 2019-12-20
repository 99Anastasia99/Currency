# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

gem "best_in_place", "~> 3.0.1"
gem "bootsnap", "1.4.5"
gem "bootstrap", "~> 4.3.1"
gem "bootstrap-datepicker-rails", "1.8.0.1"
gem "bootstrap-sass", "3.4.1"
gem "coffee-rails", "5.0.0"
gem "jbuilder", "2.9.1"
gem "jquery-rails", "4.3.1"
gem "rails-assets-vuex", source: "https://rails-assets.org"

gem "rspec"
gem "rubocop"
gem "rubocop-rspec"
gem "vuejs-rails", "2.5.13"
# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "6.0.1"
gem "ransack"
# Use mysql as the database for Active Record
gem "money"
gem "mysql2", ">= 0.4.4"
# Use Puma as the app server
gem "puma", "3.12.2"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "devise"
gem "devise_invitable", "2.0.1"
gem "enumerize"
gem "figaro"
gem "kaminari"
gem "omniauth"
gem "pry"
gem "receipts"
gem "simple_form"
gem "chartkick"
gem "groupdate", "4.2.0 "
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use Active Model has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "2.0.2"
  gem "spring-watcher-listen", "2.0.1"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
