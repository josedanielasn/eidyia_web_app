FactoryBot.define do

  factory :program do     
      transient do
        batch { create(:batch) }
        course { create(:course) }
      end
        course_id {course.id}
        batch_id {batch.id}     
  end
end 
  