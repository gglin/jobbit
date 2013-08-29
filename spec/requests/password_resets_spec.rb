require 'spec_helper'

describe "PasswordResets" do
  describe "GET /password_resets" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get password_resets_path
      response.status.should be(200)
    end
  end

  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit login_path
    click_link "password"
    fill_in "Email", :with => user.email
    click_button "Reset Password"
  end
end

