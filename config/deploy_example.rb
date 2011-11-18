$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "rvm/capistrano"
require "bundler/capistrano"
require "capistrano_colors"

set :application, "analysis"
set :repository,  "git@github.com:dpaluy/analysis.git"

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/www/#{application}"
set :use_sudo, false

role :web, "web server"
role :app, "web server"
role :db,  "mysql db server", :primary => true 
set :user, "username"

set :rails_env, "production"

set :rvm_ruby_string, "ruby-1.9.2-p290"
set :rvm_type, :user

set :unicorn_pid do
  "#{shared_path}/pids/unicorn.pid"
end

before "deploy:assets:precompile", "bundle:install"

namespace :deploy do
  task :start do
    top.unicorn.start
  end

  task :stop do
    top.unicorn.stop
  end

  task :restart do
    top.unicorn.reload
  end
end

namespace :unicorn do
  desc "start unicorn server"
  task :start, :roles => :app do
    run "cd #{current_path} && bundle exec unicorn -E #{rails_env} -D -P #{unicorn_pid}"
  end

  desc "stop unicorn server"
  task :stop
    run "kill -s QUIT `cat #{unicorn_pid}`"
  end

  desc "restart unicorn"
  task :restart
    top.unicorn.stop
    top.unicorn.start
  end

  desc "reload unicorn (gracefully restart workers)"
  task :reload
    run "kill -s USR2 `cat #{unicorn_pid}`"
  end

  desc "reconfigure unicorn (reload config and gracefully restart workers)"
  task :reconfigure, :roles => :app do
    run "kill -s HUP `cat #{unicorn_pid}`"
  end
end
