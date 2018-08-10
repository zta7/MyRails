require_relative 'boot'
require 'rails/all'

# 启动项目前把你需要的gem放入
Bundler.require(*Rails.groups)

module New
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # 根据rails版本初始化
    config.load_defaults 5.2
    # Grape 配置
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    # autoload_paths 默认是app下的全部子目录，自动加载里面的常量(类啊 常量啊 模型啊。。)
    # cache_classes=false 自动加载常量才生效，也就是生产模式无效
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
    # ActiveJob
    config.active_job.queue_adapter = :sidekiq
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # 应用配置会转向 config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # 在 config/environments/* 的设置优先级高于这里
    # 应用配置会转向 config/initializers
    # 别的ruby文件会在加载骨架和gems后自动载入你的应用
    
    # 这里有5个初始化事件的钩子 ,其一如下, 自行google
    config.after_initialize do
      puts "初始化rails和/config/initilaizers中的所有脚本"
    end
  end
end

# config.XXX  配置rails本身
# config.active_admin.XXX 配置rails的active_admin插件