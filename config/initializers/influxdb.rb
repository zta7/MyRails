require 'influxdb'
influx_config  = YAML.load_file("#{Rails.root}/config/influxdb.yml")[Rails.env]
$influxdb = InfluxDB::Client.new("rails_app", hosts: ["127.0.0.1"], port: 8088, username: "root", password: "root")

# 关注 ActionController 的 process_action 通知，会收到所有的请求
ActiveSupport::Notifications.subscribe('process_action.action_controller') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)

  info = {
    action: "#{event.payload[:controller]}##{event.payload[:action]}", 
    runtime: event.duration,
    db_runtime: event.payload[:db_runtime],
    server: Socket.gethostname,
    status: event.payload[:status] 
  }

  $influxdb.write_point("process_action.action_controller", info)
end