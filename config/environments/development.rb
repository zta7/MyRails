Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  # 默认配置 以及 默认值 
  config.action_view.cache_template_loading = false # 控制每次请求是否重新加载模板
  config.colorize_logging = true # 指定日志是否用ANSI颜色
  config.consider_all_requests_local = true # 发生错误时,是否把错误信息转储到HTTP响应中
  config.eager_load_namespaces # 应用 引擎 命名空间
  config.eager_load_paths # app下所有子目录
  config.force_ssl # 强制HTTPS
  config.logger # 指定 Rails.logger 和与 Rails 有关的其他日志（ActiveRecord::Base.logger）所用的日志记录器
                # 默认值为 ActiveSupport::TaggedLogging 实例
  config.log_level = 'debug' # 日志详细等级
  config.log_tags #

  config.cache_classes = false # 代码 再请求时在家变更

  # Do not eager load code on boot.
  config.eager_load = false
  puts "config.eager_load_namespaces : #{config.eager_load_namespaces}"
  puts "config.eager_load_paths : #{config.eager_load_paths}"  

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # - -!
  # config.action_mailer.delivery_method = :sendmail, :welcome_email
  config.action_mailer.default_url_ options = { :host => 'http://0.0.0.0:3000' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :domain               =>'qq.com',
    :authentication       =>'login',
    :enable_starttls_auto => true  ,
    :address              => "smtp.qq.com",       # default:QQ_Email
    :port                 => 25,                 # default: 25
    :user_name            => '956152989@qq.com',
    :password             => 'etkmldrvpgtubefc'    
  }






end


