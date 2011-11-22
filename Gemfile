require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://rubygems.org'
gem 'rails', '3.1.2'
gem 'sqlite3'
gem 'mysql2'
gem 'date_validator'
gem 'lazy_high_charts'
gem 'capistrano'
gem 'capistrano_colors'

gem 'unicorn', :group => :production

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
if HOST_OS =~ /linux/i
  gem 'therubyracer'
end
gem 'kaminari'
gem "haml", ">= 3.1.2"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "rspec-rails", ">= 2.8.0.rc1", :group => [:development, :test]
gem "factory_girl_rails", ">= 1.3.0", :group => :test
gem "cucumber-rails", ">= 1.2.0", :group => :test
gem "capybara", ">= 1.1.1", :group => :test
gem "database_cleaner", ">= 0.6.7", :group => :test
gem "launchy", ">= 2.0.5", :group => :test
gem "guard", ">= 0.6.2", :group => :development
case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "guard-cucumber", ">= 0.6.1", :group => :development
gem "zurb-foundation"
