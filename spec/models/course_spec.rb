require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Testing for validations" do

    it '1. Should not have an empty course name' do
      course = build(:course, course_name: '')
      expect(course.valid?).to eq(false)  
    end

    it '2. Should not have course name with length less than 2' do
      course = build(:course, :invalid_course_name)
      expect(course.valid?).to eq(false) 
    end

    it '3. Should not have course name with length greater than 20' do
      course = build(:course, course_name: '1'*21)
      expect(course.valid?).to eq(false) 
    end

    it '4. Should accept valid course format' do
      course = build(:course)
      expect(course.valid?).to eq(true) 
    end

  end
  
end
