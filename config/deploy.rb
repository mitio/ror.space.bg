set :application,   'ror.space.bg'
set :repository,    'git://github.com/mitio/ror.space.bg.git'
set :scm,           :git
set :deploy_via,    :remote_cache
set :user,          'rorspace'
set :deploy_to,     "/home/#{user}/#{application}"
set :use_sudo,      false

role :web, "#{application}"
role :app, "#{application}"
role :db,  "#{application}", :primary => true

# Simulate a TTY via the pseudo-TTY feature of Capistrano.
default_run_options[:pty] = true

# Don't try to set the mtime of the static files in public.
# Remove this line if you're not using the new Rails 3.1 asset pipeline.
set :normalize_asset_timestamps, false

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
