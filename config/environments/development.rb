Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  # 默认配置 以及 默认值 
  config.action_view.cache_template_loading = false # 控制每次请求是否重新加载模板 
  config.colorize_logging = true                    # 指定日志是否用ANSI颜色
  config.consider_all_requests_local = true         # 发生错误时,是否把错误信息转储到HTTP响应中
  config.eager_load_namespaces                      # 应用 引擎 命名空间
  config.eager_load_paths                           # app下所有子目录
  config.force_ssl                                  # 强制HTTPS
  config.logger                                     # 指定 Rails.logger 和与 Rails 有关的其他日志（ActiveRecord::Base.logger）所用的日志记录器
                                                    # 默认值为 ActiveSupport::TaggedLogging 实例
  config.log_level = 'debug'  # 日志详细等级
  config.log_tags #
  config.session_store        #:cookie_store（默认值）
  # 静态资源配置 以及 默认默认值
  config.asset_host                 # 静态资源文件CDN 或者 想绕开浏览器对同一域名的并发连接数的限制时可以使用这个选项
  config.assets.enabled = true      # 是否开启asset pipeline
  config.assets.raise_runtime_errors# 额外的运行时错误检查,推荐开发模式为ture  
  config.assets.raise_runtime_errors = true
  config.assets.css_compressor      # 压缩CSS 默认 :sass
  config.assets.js_compressor       # 压缩JS
  config.assets.gzip = true         # 在静态常规资源外是否有 gzip版本
  config.assets.paths               # 静态资源路径
  config.assets.precompile          # 设定运行rake assets:precompile任务时其他资源
  config.assets.prefix              # 定义伺服静态资源的前缀。默认为 /assets。
  config.assets.compile             # 是否开启Sprockets编译
  config.assets.digest = true       # 是否在静态资源的名称中包含 SHA256 指纹
  config.assets.debug               # 禁止拼接和压缩静态文件
  config.assets.version             # 是在生成 SHA256 哈希值过程中使用的一个字符串。修改这个值可以强制重新编译所有文件。
  config.assets.logger              # 默认同config.logger
  config.assets.quiet               # 禁止在日志中记录对静态资源的请求
  # i18n 国际化
  config.i18n.available_locales                # 本地化白名单 , 新rails只有 :en
  config.i18n.default_locale                   # 设定供 i18n 使用的默认本地化。默认为 :en。
  config.i18n.enforce_available_locales = true # 如果没有配置的本地化文件就抛错
  config.i18n.load_path                        # 设定rails本地化路径
  config.i18n.fallbacks                        # 设定没有翻译时的默认行为 自己看demo
  config.i18n.available_locales = [:"zh-CN",:"devise.zh-CN",:"devise.en",:en] #优先级按顺序排。
  config.i18n.default_locale = :"zh-CN" 
  config.i18n.fallbacks = true 
  config.i18n.fallbacks = {"zh-CN": :en ,"devise.zh-CN": :"devise.en"}

  config.relative_url_root  # 项目根路径
  # 时区
  config.time_zone = 'Beijing'


  config.cache_classes = false # 代码再请求时变更

  # Do not eager load code on boot.
  config.eager_load = false
  # puts "config.eager_load_namespaces : #{config.eager_load_namespaces}"
  # puts "config.eager_load_paths : #{config.eager_load_paths}"  

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


