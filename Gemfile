source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg', '~> 0.21'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jwt'
gem 'argon2'
  gem 'faker'
gem 'omniauth-auth0', '~> 2.2'
gem 'omniauth-rails_csrf_protection', '~> 0.1'
gem 'pundit'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
