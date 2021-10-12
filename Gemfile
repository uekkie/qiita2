source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.2.1'

gem 'sqlite3', group: [:development, :test]
gem 'pg', '0.20.0', group: :production

gem 'puma', '~> 4.3'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'haml'
gem 'rails-i18n'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.6.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'bullet'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara', '~> 2.15.2'
  gem 'launchy', '~> 2.4.3'
  gem 'factory_bot_rails', '~> 4.8.2'
end

gem 'redcarpet'
gem 'acts-as-taggable-on'
gem 'faker'
gem 'kaminari'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
