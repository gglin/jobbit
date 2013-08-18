OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV["LINKEDIN_KEY"], ENV["LINKEDIN_SECRET"], 
           :scope  => 'r_fullprofile r_emailaddress r_network', 
           :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
  provider :twitter,  ENV['TWITTER_KEY'],  ENV['TWITTER_SECRET']
end