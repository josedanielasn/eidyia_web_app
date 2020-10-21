FactoryBot.define do
  sequence(:firstname) { |i| "#{i.to_s}firstname" }
  sequence(:lastname) { |i| "#{i.to_s}lastname" }
  sequence(:username) { |i| "#{i.to_s}username" }
  sequence(:email) { |i| "#{i.to_s}email@email.com" }
  sequence(:password) { |i| "#{i.to_s}password" }

  factory :user do
    firstname { 'firstname1' }
    lastname  { 'lastname1' }
    username  { 'username1' }
    email {'email@yahoo.com'}
    password {'password1234'}

    trait :admin do 
      role {'admin'}
    end

    trait :instructor do 
      role {'instructor'}
    end

    trait :student do 
      role {'student'}
    end

    trait :same_username do
      username {'username1'}
    end

    trait :invalid_firstname do
      username {'1'}
    end

    trait :another_uniq_user do
      firstname { 'firstname2' }
      lastname  { 'lastname2' }
      username  { 'username2' }
      email {'email2@yahoo.com'}
      role {'admin'}
      password {'password1234'}
    end

    trait :generate_user do
      firstname { FactoryBot.generate(:firstname) }
      lastname { FactoryBot.generate(:lastname) }
      username { FactoryBot.generate(:username) }
      email { FactoryBot.generate(:email) } 
      password { FactoryBot.generate(:password) }
    end

    factory :another_user_same_username,   traits: [:another_uniq_user, :same_username, :admin] 
  end
end
