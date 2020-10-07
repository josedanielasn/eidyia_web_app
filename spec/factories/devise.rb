FactoryBot.define do
    factory :user do
      id {1}
      email {"test@email.com"}
      firstname {"John"}
      lastname {"Doe"}
      username {"user_name"}
      password {"password"}
      role {0}
    end
end 
