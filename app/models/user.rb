class User < ActiveRecord::Base
  has_secure_password

  has_many :identities

  attr_accessible :email, :password, :password_confirmation, :name, :twitter, :linkedin

  # validates_uniqueness_of :email

  # def self.from_omniauth(auth)
  #   where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  # end

  # def self.create_from_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["nickname"]
  #   end
  # end

  def self.from_omniauth(auth)
    user = "" #initialize a user variable so that we can return it after the block
    Identity.where(auth.slice(:provider, :uid)).first_or_initialize.tap do |identity|
      identity.provider = auth.provider
      identity.uid = auth.uid
      identity.oauth_token = auth.credentials.token
      identity.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
      identity.save
      if !identity.user_id
        user = User.create(:name => auth.info.name, :email => auth.info.email)
        # user.twitter = '@' + auth.info.nickname if auth.info.nickname # only for Twitter
        user.identities << identity
        user.password = rand(2**62).to_s
        user.save
      else
        user = User.find(identity.user_id)
        user.save
      end
    end
    user
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
