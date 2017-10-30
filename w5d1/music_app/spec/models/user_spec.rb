require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.create!(email: "test", password: "pass123") }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#valid_pasword?" do
    it "returns true for the correct password" do
      expect(subject.valid_password?("pass123")).to be true
    end

    it "returns false fo the incorrect password" do
      expect(subject.valid_password?("pass13")).to be false
    end
  end

  describe "#reset_session_token" do
    it "resets the session token" do
      st = subject.session_token
      subject.reset_session_token!
      expect(subject.session_token).not_to eq(st)
    end
  end

  describe "::find_by_credentials" do
    user2 = User.create(email: "test4", password: "pass123")
    context "with correct credentials" do
      it "returns a user" do
        expect(User.find_by_credentials("test3", "pass123")).to eq(user2)
      end
    end

    context "with incorrect credentials" do
      it "returns nil" do
        expect(User.find_by_credentials("test", "pass123")).to eq(nil)
      end
    end
  end

end
