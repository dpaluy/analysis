$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "rvm/capistrano"
require "bundler/capistrano"
require "capistrano_colors"

# For Debug
set :rake, "#{rake} --trace"

set :domain, "ec2-107-22-186-230.compute-1.amazonaws.com"
set :user, "ubuntu"
set :application, "analysis"
set :repository,  "git@github.com:dpaluy/analysis.git"

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/www/#{application}"
set :use_sudo, false

role :web, domain
role :app, domain
role :db, domain, :primary => true 

set :rails_env, "production"

set :rvm_ruby_string, "ruby-1.9.2-p290"
set :rvm_type, :user
set :normalize_asset_timestamps, false # disable Capistrano warning - Rails 3.1

# Set up SSH so it can connect to the EC2 node - assumes your SSH key is in ~/.ssh/id_rsa
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")] 

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
  task :stop do
    run "kill -s QUIT `cat #{unicorn_pid}`"
  end

  desc "restart unicorn"
  task :restart do
    top.unicorn.stop
    top.unicorn.start
  end

  desc "reload unicorn (gracefully restart workers)"
  task :reload do
    run "kill -s USR2 `cat #{unicorn_pid}`"
  end

  desc "reconfigure unicorn (reload config and gracefully restart workers)"
  task :reconfigure, :roles => :app do
    run "kill -s HUP `cat #{unicorn_pid}`"
  end
end
