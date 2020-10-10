require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do
    let(:user) {build(:user, :admin)}
    context "Testing for presence" do
      it "1.) is not valid without a firstname" do
        user.firstname = ''
        expect(user.valid?).to equal(false)
      end

      it "2.) is not valid without a lastname" do
        user.lastname = ''
        expect(user.valid?).to equal(false)
      end

      it "3.) is not valid without a username" do
        user.username = ''
        expect(user.valid?).to equal(false)
      end

      it "4.) is not valid without a password" do
        user.password = ''
        expect(user.valid?).to equal(false)
      end

      it "5.) is not valid without a role" do
        user.role = ''
        expect(user.valid?).to equal(false)
      end
    end

    context "Testing for length " do
      it "6.) it is not valid if the firstname has less than 2 characters" do
        user.firstname = '1'
        expect(user.valid?).to  equal(false)
      end

      it "7.) it is not valid if the lastname has less than 2 characters" do
        user.lastname = '1'
        expect(user.valid?).to  equal(false)
      end

      it "8.) it is not valid if the username has less than 3 characters" do
        user.username = '11'
        expect(user.valid?).to  equal(false)
      end

      it "9.) it is not valid if the firstname has greater than 20 characters" do
        user.firstname = '1'* 21
        expect(user.valid?).to  equal(false)
      end

      it "10.) it is not valid if the lastname has greater than 20 characters" do
        user.lastname = '1'* 21
        expect(user.valid?).to  equal(false)
      end

      it "11.) it is not valid if the firstname has greater than 30 characters" do
        user.username = '1'* 31
        expect(user.valid?).to  equal(false)
      end
    end
    
    describe "Testing for uniqueness" do
      it "12.) it is not valid if the username is not unique" do
        user.save
        user_dup = build(:another_user_same_username)
        expect(user_dup.valid?).to  equal(false)
      end
    end
    

  end
  
end
