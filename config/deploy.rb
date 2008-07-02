set :application, "plop.lusberde.com.ar"

set :user, "virtualizar"
default_run_options[:pty] = true 

set :use_sudo,false

#after  dns setup
#role :app, "#{application}"
#role :web, "#{application}"
#role :db,  "#{application}", :primary => true

set :scm, :git
set :keep_releases,3
set :deploy_via, :remote_cache

role :app, "www.virtualizar.com.ar"
role :web, "www.virtualizar.com.ar"
role :db,  "www.virtualizar.com.ar", :primary => true

# Set the path to your version control system (Subversion assumed)
set :repository, "git@github.com:peterpunk/plop.git"


#Set the full path to your application on the server
set :deploy_to, "/home/virtualizar/apps/#{application}"

desc "Link in the production extras and Migrate the Database ;)"
task :after_update_code do
  #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  #run "ln -nfs #{shared_path}/config/merb.yml #{release_path}/config/merb.yml"
  run "ln -nfs #{shared_path}/log #{release_path}/log"
  #if you use ActiveRecord, migrate the DB
  #deploy.migrate
end

namespace :deploy do 
 desc "Start Merb Instances"  
  task :start do 
    run "merb -a #{adapter} -e production -c #{processes} --port #{start_port} -m #{current_path} -L #{log_path}"  
  end 
 
  desc "Stop Merb Instances"  
  task :stop do 
    run "cd #{current_path} && merb -a #{adapter} -k all"  
  end 
 
  desc 'Custom restart task for Merb' 
  task :restart, :roles => :app do 
    deploy.stop 
    deploy.start 
  end 
end
#Overwrite the default deploy.migrate as it calls:
#rake RAILS_ENV=production db:migrate
desc "MIGRATE THE DB! ActiveRecord"
deploy.task :migrate do
  run "cd #{release_path}; rake db:migrate MERB_ENV=production"
end
