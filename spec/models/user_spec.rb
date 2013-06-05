require 'spec_helper'

describe User do
  let(:user) { Fabricate(:user) }
  subject { user }
  it { should be_valid }

  context "should not be valid" do
    # gettin' all meta up in here
    %w(username email).each do |method|
      it "for nil #{ method }" do
        subject.send("#{ method.to_sym }=", nil)
        subject.should_not be_valid
      end
    end
  end

  context "bios" do
    it "can be blank" do
      subject.bio.should == ""
      subject.should be_valid
    end

    it "can't be longer than a tweet" do
      subject.bio = "a" * 141
      subject.should_not be_valid
    end
  end

  describe "#set_hash" do
    it "should properly hexify (is that a thing?)" do
      test_digest = Digest::MD5.hexdigest('foo@bar.org')
      subject.set_hash.should == test_digest
    end
  end
end
