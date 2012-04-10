# Bundler bootstrap
#require 'bundler/capistrano'

# main details
set :application, "dealer_toolbox"
role :web, "localhost"
role :app, "localhost"
role :db, "localhost", :primary => true

# server details
#default_run_options[:pty] = true
#ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/dealer_toolbox"
set :user, "robby"
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
    #run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

#before 'deploy:assets:precompile', 'deploy:symlink_shared'
#before 'deploy:symlink_shared'
