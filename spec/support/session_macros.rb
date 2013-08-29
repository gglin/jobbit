module SessionMacros
  def login_user
    let(:user) { FactoryGirl.create(:user) }
    post login_path, :login => user.login, :password => 'secret'
  end
end