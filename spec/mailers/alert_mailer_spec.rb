require "spec_helper"

describe AlertMailer do
  describe "changed_bio" do
    let(:mail) { AlertMailer.changed_bio }

    it "renders the headers" do
      mail.subject.should eq("Changed bio")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
