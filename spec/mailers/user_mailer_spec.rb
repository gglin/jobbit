require "spec_helper"

# may have to run this to make sure tests pass:  bundle exec rake db:test:prepare

describe UserMailer do
  context "#password_reset" do
    let(:user) { FactoryGirl.create(:user, :password_reset_token => "anything") }
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      mail.subject.should eq("Password reset")
      mail.to.first.should match(/foo\d+@example\.com/)
      mail.to.should eq([user.email])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(edit_password_reset_path(user.password_reset_token))
    end
  end
end
