require 'spec_helper'

describe Ohayo::API do
  let(:user) { Fabricate(:user) }
  let(:hash) { Digest::MD5.hexdigest(user.email) }
  describe "GET /api/users/show/" do
    it "returns correctly when grabbing a bio for a nil user" do
      get "/api/users/show/foofoofoo"
      response.body.should == "null"
    end
    it "returns correctly when no bio is set" do
      get "/api/users/show/#{ hash }"
      response.status.should == 200
      response.body.should == "This user has not set a bio yet."
    end
    it "returns a bio when it is set" do
      bio = "foo the bar!"
      user.update_attributes! bio: bio
      get "/api/users/show/#{ hash }"
      response.body.should == bio
    end
  end
end
