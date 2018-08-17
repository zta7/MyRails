port        ENV.fetch("PORT") { 3000 }

worker = 1
threads = 1,5
environment ENV.fetch("RAILS_ENV") { "development" }
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
bind "unix://#{shared_dir}/sockets/puma.sock"
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

plugin :tmp_restart
