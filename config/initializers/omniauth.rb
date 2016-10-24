Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['145824262549538'], ENV['9557b03f254b68363bcb1b8fd36bb316']
end