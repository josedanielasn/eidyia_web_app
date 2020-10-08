FactoryBot.define do

  factory :session do     
      transient do
        program { create(:program) }
      end
        session_name {'session_name'}
        program_id {program.id}
       
  end

end 
