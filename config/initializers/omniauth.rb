Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '179475972208945', 'dd385b326e65b01d4734172f80504f49', :strategy_class => OmniAuth::Strategies::Facebook
end