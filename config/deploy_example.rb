$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "rvm/capistrano"
require "bundler/capistrano"
require "capistrano_colors"
require File.expand_path(File.join(File.dirname(__FILE__), 'capistrano_database'))

# =====================================================================
# REQUIRED VARIABLES
# =====================================================================

# For Debug
#set :rake, "#{rake} --trace"
set :domain, "ec2-XXX-XXX-XXX-XXX.compute-1.amazonaws.com"
set :user, "XXXXXXXXXXX" # server username
set :application, "analysis"
set :rvm_ruby_string, "ruby-1.9.2-p290"
set :rvm_type, :user
set :normalize_asset_timestamps, false # disable Capistrano warning - Rails 3.1

# =====================================================================
# SCM OPTIONS
# =====================================================================
default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :scm, :git
set :repository,  "git@github.com:dpaluy/analysis.git"
set :git_account, "dpaluy"
set :scm_passphrase, "XXXXXXXXXXXXX"  # The deploy user's password
#set :scm_passphrase, Proc.new { Capistrano::CLI.password_prompt('Git Password: ') }
set :branch, "master"

# =====================================================================
# SSH OPTIONS
# =====================================================================
set :use_sudo, false
ssh_options[:forward_agent] = true
# Set up SSH so it can connect to the EC2 node - assumes your SSH key is in ~/.ssh/id_rsa
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")] 

# =====================================================================
# ROLES
# =====================================================================
role :web, domain
role :app, domain
role :db, domain, :primary => true 

# =====================================================================
# CAPISTRANO OPTIONS
# =====================================================================
set :rails_env, "production"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/rails/#{application}"
set :git_shallow_clone, 1
set :git_enable_submodules, 1

set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
set :server, :unicorn

# =====================================================================
# Project CAPISTRANO TASKS
# =====================================================================
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
    run "cd #{current_path} && bundle exec unicorn -c #{current_path}/config/unicorn.rb -E #{rails_env} -D"
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
