require "spec_helper"

# may have to run this to make sure tests pass:  bundle exec rake db:test:prepare

describe UserMailer do
  describe "password_reset" do
    user = FactoryGirl.create(:user)
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      mail.subject.should eq("Password reset")
      mail.to.should eq(["foo1@example.com"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
