Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '242371179864648', '19b21e9c7a934fc8f2dd0ff2f4cf9797'
end
