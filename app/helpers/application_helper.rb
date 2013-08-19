module ApplicationHelper

  def enter_api_keys
    Crunchbase::API.key = ENV["CRUNCHBASE_KEY"]

    LinkedIn.configure do |config|
      config.token  = ENV["LINKEDIN_KEY"]
      config.secret = ENV["LINKEDIN_SECRET"]
    end

    # client = LinkedIn::Client.new(ENV["LINKEDIN_KEY"], ENV["LINKEDIN_SECRET"])

    # rtoken = client.request_token.token
    # rsecret = client.request_token.secret
    # client.authorize_from_request(rtoken, rsecret, 97618)
  end

end
