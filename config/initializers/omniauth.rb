

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "242371179864648", "19b21e9c7a934fc8f2dd0ff2f4cf9797"
end

# OmniAuth.config.logger = Rails.logger
# Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :facebook, Rails.application.secrets.facebook_app_id,
#  Rails.application.secrets.facebook_app_secret, scope: ‘public_profile’, info_fields: ‘id,name,link’
# end
