require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){
              User.new(first_name: "Michelle",
                       last_name: "Golle",
                       username: "michellegolle",
                       email: "michelle@golle.com",
                       password: "password",
                       password_confirmation: "password")
            }

  context "with valid credentials" do
    it "can be created" do
      assert_equal "michellegolle", user.username
      assert_equal "michelle@golle.com", user.email
      expect(user).to be_valid
    end
  end

  context "with invalid credentials" do
    it "cannot be created without username" do
      user.username = ''
      expect(user).to_not be_valid
    end
    it "cannot be created without email" do
      user.email = ''
      expect(user).to_not be_valid
    end
  end
end
