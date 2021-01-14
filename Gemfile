source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.0'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'redis', '~> 4.0'
gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap', '~> 5.0.0.alpha3'
gem 'font-awesome-sass', '~> 5.15.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

gem "hotwire-rails", "~> 0.1.1"
gem "devise", "~> 4.7"
gem "haml-rails", "~> 2.0"
gem "foreman", "~> 0.87.2"
gem 'listen', '~> 3.3'
gem "ruby-audioinfo", "~> 0.5.2", require: "audioinfo"
gem "mp4info", github: "arbarlow/ruby-mp4info"

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'wdm', '>= 0.1.0', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
