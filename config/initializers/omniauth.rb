OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :linkedin, ENV["LINKEDIN_KEY"], ENV["LINKEDIN_SECRET"], 
           :scope => 'r_fullprofile r_emailaddress r_network r_contactinfo' 
           # :state => params[:state]
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
           # :state => params[:state]
end