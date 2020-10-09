FactoryBot.define do

  factory :session do
    session_name {'session_name'}
    program_id {program.id}
      
      transient do
        program { create(:program) }
      end
         
      trait :invalid_session_name do 
        session_name {''} 
      end 
  end

end 
