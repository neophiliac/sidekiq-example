require "spec_helper"

describe Notifications do
  describe "too_fast" do
    let(:mail) { Notifications.too_fast("to@example.org") }

    it "renders the headers" do
      mail.subject.should eq("Too fast")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "too_slow" do
    let(:mail) { Notifications.too_slow("to@example.org") }

    it "renders the headers" do
      mail.subject.should eq("Too slow")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
