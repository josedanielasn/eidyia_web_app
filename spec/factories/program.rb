FactoryBot.define do
  factory :program do
    transient do
      course{create(:course)}
      batch{create(:batch)}
      course_2{create(:course, :edited_course)}
      batch_2{create(:batch, :edited_batch)} 
    end
     course_id {course.id}
     batch_id {batch.id}

    trait :invalid_program do
      course_id {nil}
      batch_id {nil}
    end

    trait :edited_program do 
      course_id {course_2.id}
      batch_id {batch_2.id}
    end
  end
end
