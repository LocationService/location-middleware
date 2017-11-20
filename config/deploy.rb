lock "~> 3.10.0"

set :application, "location_middleware"
set :repo_url, "git@github.com:LocationService/location-middleware.git"

set :ssh_options, { forward_agent: true }

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "~/#{fetch(:application)}"
set :keep_releases, 10

set :rbenv_type, :user
set :rbenv_ruby, "2.4.2"

append :linked_files, ".env"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"

after "deploy:publishing", "unicorn:restart"