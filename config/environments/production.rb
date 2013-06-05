Moshimoshi::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.mandrillapp.com",
    :port                 => 587,
    :user_name            => ENV['MANDRILL_USERNAME'],
    :password             => ENV['MANDRILL_APIKEY'],
    :enable_starttls_auto => true,
    :domain               => 'heroku.com',
    :authentication       => 'plain'
  }
  config.action_mailer.default_url_options = { :host => 'moshimoshi.me' }
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
end
