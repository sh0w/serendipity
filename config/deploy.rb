#set :application, "set your application name here"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

require "bundler/capistrano"
set :application, "serendipity"
set :scm, :git
#set :repository,  "ssh://repos.mediacube.at/opt/git/web_2012/serendipity.git/"
set :repository,  "https://github.com/sh0w/serendipity.git"
set :deploy_to, "/var/www/virthosts/serendipity.mediacube.at"
set :user, "deploy_serendipity"
set :branch, "master"
default_run_options[:pty] = true
set :use_sudo, false
set :port, 5412
role :web, "mediacube.at"                   # Your HTTP server, Apache/etc
role :app, "mediacube.at"                   # This may be the same as your `Web` server
role :db,  "mediacube.at", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here
set :bundle_flags, "--deployment --quiet"