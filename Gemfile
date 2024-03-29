require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://rubygems.org'
gem 'rails', '3.1.3'
gem 'sqlite3'
gem 'mysql2'
gem 'date_validator'
gem 'lazy_high_charts'
gem 'capistrano'
gem 'capistrano_colors'
gem 'jquery-rails'
if HOST_OS =~ /linux/i
  gem 'therubyracer'
end
gem 'kaminari'
gem "haml", ">= 3.1.2"

gem 'unicorn', :group => :production
gem "simple_form"
gem 'delayed_job'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem "rspec-rails", ">= 2.8.0.rc1", :group => [:development, :test]
gem 'mocha', :group => [:development, :test]

group :development do
  gem 'ruby-debug19'
  gem 'nifty-generators'
  gem "haml-rails", ">= 0.3.4"
  gem "guard", ">= 0.6.2"
  case HOST_OS
    when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
  end
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
end

group :test do
  gem "factory_girl_rails", ">= 1.3.0"
  gem "cucumber-rails", ">= 1.2.0"
  gem "capybara", ">= 1.1.1"
  gem "database_cleaner", ">= 0.6.7"
  gem "launchy", ">= 2.0.5"
end
