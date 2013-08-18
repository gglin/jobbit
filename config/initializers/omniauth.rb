OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
  provider :twitter,  ENV['TWITTER_KEY'],  ENV['TWITTER_SECRET']
end