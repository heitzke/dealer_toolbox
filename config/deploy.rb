# Bundler bootstrap
#require 'bundler/capistrano'

# main details
set :application, "dealer_toolbox"
#role :web, "127.0.0.1"
#role :app, "127.0.0.1"
#role :db, "127.0.0.1", :primary => true
role :web, "108.171.191.103"
role :app, "108.171.191.103"
role :db, "108.171.191.103", :primary => true


# server details
#default_run_options[:pty] = true
#ssh_options[:forward_agent] = true
#set :deploy_to, "/home/robby/dealer_toolbox"
set :deploy_to, "/home/deployer/dealer_toolbox"
#set :user, "robby"
set :user, "deployer"
set :use_sudo, true

# repo details
set :scm, :git
set :git_username, "rclements"
set :repository, "git://github.com/rclements/dealer_toolbox.git"
set :branch, "master"
#set :git_enable_submodules, 1

# runtime dependencies
#depend :remote, :gem, "bundler"

# tasks
namespace :deploy do
  before 'deploy:setup', :db

  task :start, :roles => :app do
    #run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end

#after 'deploy:symlink_shared'
