require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation Tests" do
    
    describe "Testing for presence" do
      
      it "should have a non-empty firstname" do
        user = build(:user, firstname: "")
        expect(user.valid?).to equal(false)
      end

      it "should have not have an empty lastname" do
        user = build(:user, lastname: "")
        expect(user.valid?).to equal(false)
      end

      it "should have not have an empty username" do
        user = build(:user, username: "")
        expect(user.valid?).to equal(false)
      end

      it "should have not have an empty password" do
        user = build(:user, password: "")
        expect(user.valid?).to equal(false)
      end

      it "should have not have an empty role" do
        user = build(:user, role: "")
        expect(user.valid?).to equal(false)
      end
    end

    describe "Testing for length " do
      it "should have a firstname with length greater or equal to 2" do
        user = build(:user, firstname: '1')
        expect(user.valid?).to  equal(false)
      end

      it "should have a lastname with length greater or equal to 2" do
        user = build(:user, lastname: '1')
        expect(user.valid?).to  equal(false)
      end

      it "should have a username with length greater or equal to 3" do
        user = build(:user, username: '11')
        expect(user.valid?).to  equal(false)
      end

      it "should have a firstname with length greater or equal to 20" do
        user = build(:user, firstname: '1' * 21)
        expect(user.valid?).to  equal(false)
      end

      it "should have a lastname with length greater or equal to 20" do
        user = build(:user, lastname: '1' * 21 )
        expect(user.valid?).to  equal(false)
      end

      it "should have a username with length greater or equal to 30" do
        user = build(:user, username: '1' * 31)
        expect(user.valid?).to  equal(false)
      end
    end
    
    describe "Testing for uniqueness" do
      it "should have a unique username" do
        user = create(:user)
        user_dup = build(:another_user_same_username)
        expect(user_dup.valid?).to  equal(false)
      end
    end
    

  end
  
end
