# set path to application
app_path = File.expand_path("../../", __dir__)
tmp_path = "#{app_path}/tmp"

working_directory app_path
pid "#{tmp_path}/pids/unicorn.pid"

worker_processes Integer(ENV["APP_PROCESSES"] || 4)
preload_app true

# Set up socket location
listen "#{tmp_path}/sockets/unicorn.sock", backlog: 128

# Logging
stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end