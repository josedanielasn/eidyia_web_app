FactoryBot.define do
    factory :batch do
      batch_name {"batch_name"} 
      
      trait :invalid_batch_name do 
        batch_name {''} 
      end 

    end
end 
