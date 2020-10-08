FactoryBot.define do
  factory :course do
    course_name {"ruby"}
  end
  
  trait :edited_course do
    course_name {'java'}
  end

  trait :invalid_course_name do
    course_name {"1"}
  end
end
