require 'rails_helper'

RSpec.describe User, type: :model do
    before :each do
      @user = User.new name: "Test User", email: "test_user_testing@test.com", password: "test", address: "123 Fake St", organization: "Test Co"
    end

    it "takes five parameters are returns a User object" do
        @user.should be_an_instance_of User
    end

    describe "#name" do
        it "returns the correct name" do
            @user.name.should eql "Test User"
        end
    end

    describe "#email" do
        it "returns the correct email" do
            @user.email.should eql "test_user_testing@test.com"
        end
    end
end
