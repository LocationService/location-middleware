# set path to application
app_dir = File.expand_path("../..", __FILE__)
tmp_dir = "#{app_dir}/tmp"
working_directory app_dir

worker_processes Integer(ENV["APP_PROCESSES"] || 4)
timeout 15
preload_app true

# Set up socket location
listen "#{tmp_dir}/sockets/unicorn.sock", backlog: 64

# Logging
stderr_path "#{app_dir}/log/unicorn.stderr.log"
stdout_path "#{app_dir}/log/unicorn.stdout.log"

# Set master PID location
pid "#{tmp_dir}/pids/unicorn.pid"

# before_fork do |server, worker|
#   Signal.trap 'TERM' do
#     puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
#     Process.kill 'QUIT', Process.pid
#   end
#
#   ActiveRecord::Base.connection.disconnect!
# end

# after_fork do |server, worker|
#   Signal.trap 'TERM' do
#     puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
#   end
#
#   ActiveRecord::Base.establish_connection
# end