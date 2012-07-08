set :application,   'ror.space.bg'
set :repository,    'git://github.com/mitio/ror.space.bg.git'
set :scm,           :git
set :deploy_via,    :remote_cache
set :use_sudo,      false

role :web, "#{application}"
role :app, "#{application}"
role :db,  "#{application}", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
