module ApplicationHelper

  def enter_api_keys
    enter_crunchbase_keys
    enter_linkedin_keys
  end

  def enter_crunchbase_keys
    Crunchbase::API.key = ENV["CRUNCHBASE_KEY"]
  end

  def enter_linkedin_keys
    # LinkedIn.configure do |config|
    #   config.token  = ENV["LINKEDIN_KEY"]
    #   config.secret = ENV["LINKEDIN_SECRET"]
    # end

    @client = LinkedIn::Client.new(ENV["LINKEDIN_KEY"], ENV["LINKEDIN_SECRET"])

    # rtoken  = client.request_token.token
    # rsecret = client.request_token.secret
    # client.authorize_from_request(rtoken, rsecret, 79550)

    @client.authorize_from_access(ENV["LINKEDIN_OAUTH_TOKEN"], ENV["LINKEDIN_OAUTH_SECRET"])
    # debugger
  end

  def money_to_num(money_str)
    return "" if money_str.nil? || money_str.empty?
    money = money_str[0] == "$"  ?  money_str[1..-1] : money_str

    if money[-1].downcase == "m"
       money[0..-2].to_f * 1e6
    elsif money[-1].downcase == "k"
       money[0..-2].to_f * 1e3
    else
       money[0..-1].to_f
    end
  end

end
