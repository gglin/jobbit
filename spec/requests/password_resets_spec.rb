require 'spec_helper'

describe "PasswordResets" do
  context "GET /password_resets/new" do
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
    puts user.email

    current_path.should eq(root_path)
    page.should have_content("Email sent")

    # this fails when we configure the test env actionmailer settings for gmail smtp
    last_email.to.should include(user.email)
  end

  it "does not email invalid user when requesting password reset" do
    # user = FactoryGirl.create(:user)
    visit login_path
    click_link "Forgot Password?"

    fill_in "Email", :with => "madeupuser@example.com"
    click_button "Reset Password"

    current_path.should eq(root_path)
    page.should have_content("Email sent")

    last_email.should be_nil
    # (ActionMailer::Base.deliveries.should eq([]) ) || ( last_email.should be_nil )
  end

  it "updates the user password when confirmation matches" do
    user = FactoryGirl.create(:user, :password_reset_token => "something", :password_reset_sent_at => 1.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)

    fill_in "Password", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password doesn't match confirmation")

    fill_in "Password", :with => "foobar"
    fill_in "Password confirmation", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password has been reset")
  end

  it "reports when password token has expired" do
    user = FactoryGirl.create(:user, :password_reset_token => "something", :password_reset_sent_at => 5.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)

    fill_in "Password", :with => "foobar"
    fill_in "Password confirmation", :with => "foobar"

    click_button "Update Password"
    page.should have_content("Password reset has expired")
  end

  it "raises record not found when password token is invalid" do
    -> {
      visit edit_password_reset_path("invalid")
    }.should raise_exception(ActiveRecord::RecordNotFound)
  end
end

