# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'risks'
set :deploy_user, 'antoine'
set :repo_url, "git@github.com:4nt1/#{fetch(:application)}.git"

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/antoine/#{fetch(:application)}"

# Install Ruby
set :rbenv_ruby, '2.1.0'      # Defaults to: 'default'

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles, [:app]

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public}


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      with rails_env: fetch(:stage) do
        within "#{current_path}" do
          execute :kill, "-s QUIT `cat #{shared_path}/unicorn.pid`"
          execute :bundle, "exec unicorn_rails -c config/unicorn/#{fetch(:stage)}_#{fetch(:application)}.rb -D"
        end
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute :kill, "-s QUIT `cat #{shared_path}/unicorn.pid`"
    end
  end

  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      with rails_env: fetch(:stage) do
        within "#{current_path}" do
          execute :bundle, "exec unicorn_rails -c config/unicorn/#{fetch(:stage)}_#{fetch(:application)}.rb -D"
        end
      end
    end
  end

  after :publishing, :restart

end

namespace :rails do
  desc "Open the rails console on each of the remote servers"
  task :console do
    on roles(:app) do |host| #does it for each host, bad.
      rails_env = fetch(:stage)
      execute_interactively "RAILS_ENV=#{rails_env} bundle exec rails c"
    end
  end

  desc "Open the rails log"
  task :log do
    on roles(:app) do |host| #does it for each host, bad.
      rails_env = fetch(:stage)
      execute_interactively "tail -f log/#{rails_env}.log"
    end
  end

  def execute_interactively(command)
    exec %Q(ssh -t antoine@#{@host.hostname} "/bin/bash --login -c 'cd #{current_path} && #{command}'")
  end
end