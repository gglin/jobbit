require 'spec_helper'

describe "PasswordResets" do
  describe "GET /password_resets/new" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get new_password_reset_path
      response.status.should be(200)
    end
  end

  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit login_path
    click_link "Forgot Password?"

    fill_in "Email", :with => user.email
    click_button "Reset Password"

    current_path.should eq(root_path)
    page.should have_content("Email sent")

    last_email.to.should include(user.email)
  end
end

