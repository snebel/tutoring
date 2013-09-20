Tutoring::Application.configure do

  config.cache_classes = true


  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = true

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Generate digests for assets URLs.
  config.assets.digest = true

  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'
    config.assets.enabled = true
  config.assets.paths << "#{Rails.root}/app/assets/files"


  config.log_level = :info

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new


end
