lock "~> 3.10.0"

set :application, "location_middleware"
set :repo_url, "git@github.com:LocationService/location-middleware.git"

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "~/#{fetch(:application)}"
set :format, :airbrussh
set :keep_releases, 10

append :linked_files, ".env"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"

