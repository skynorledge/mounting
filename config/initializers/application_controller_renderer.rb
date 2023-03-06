module TimeFormatSandbox
  class Application < Rails::Application
    # ...

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Tokyo'
  end
end




# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
