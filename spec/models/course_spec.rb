require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Validations" do

    context "when creating a course" do

      it '1.) it is not valid without a course name' do
        course = build(:course, course_name: '')
        expect(course.valid?).to eq(false)  
      end

      it '2.) it is not valid if course name has less than 2 characters' do
        course = build(:course, :invalid_course_name)
        expect(course.valid?).to eq(false) 
      end

      it '3.) it is not valid if course name has greater than 20 characters' do
        course = build(:course, course_name: '1'*21)
        expect(course.valid?).to eq(false) 
      end

      it '4.) it should save if course name has valid format' do
        course = build(:course)
        expect(course.valid?).to eq(true) 
      end
  
    end
    
  end
  
end
