# set path to application
app_path = File.expand_path("../../", __dir__)
tmp_path = "#{app_path}/tmp"

working_directory app_path
pid "#{tmp_path}/pids/unicorn.pid"

worker_processes Integer(ENV["APP_PROCESSES"] || 2)
preload_app true

# Set up socket location
listen "#{tmp_path}/sockets/unicorn.sock", backlog: 64

# Logging
stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{app_path}/current/Gemfile"
end

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
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
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end