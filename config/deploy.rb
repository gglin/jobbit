require 'bundler/capistrano' # for bundler support

set :application, "jobbit"
set :repository,  "git@github.com:gglin/jobbit.git"

set :user, 'gglin'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

role :web, "192.241.140.74"                          # Your HTTP server, Apache/etc
role :app, "192.241.140.74"                          # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_config, :roles => :app do
    run "ln -nfs #{shared_path}/config/application.yml #{current_release}/config/application.yml"
  end
end

# Load assets here and create symlinks.
after 'deploy:update_code','deploy:symlink_config'