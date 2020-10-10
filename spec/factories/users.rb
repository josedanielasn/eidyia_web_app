FactoryBot.define do
  factory :user do
    firstname { 'firstname1' }
    lastname  { 'lastname1' }
    username  { 'username1' }
    email {'email@yahoo.com'}
    password {'password1234'}

    trait :admin do 
      role {0}
    end

    trait :same_username do
      username {'username1'}
    end

    trait :another_uniq_user do
      firstname { 'firstname2' }
      lastname  { 'lastname2' }
      username  { 'username2' }
      email {'email2@yahoo.com'}
      role {0}
      password {'password1234'}
    end

    factory :another_user_same_username,   traits: [:another_uniq_user, :same_username, :admin] 
  end
end
