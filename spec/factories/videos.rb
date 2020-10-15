FactoryBot.define do
    factory :video do
      video_title {"video title"}
      video_description {"video description"}
      session_id {session.id}  

      transient do
        session { create(:session) }
      end
  
      trait :invalid_video_title do 
        video_title {''} 
      end

      trait :edited_video_title do 
        video_title {'Editing my video title'} 
      end

      trait :with_thumbnail do
        thumbnail { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'Bike.png'), 'image/png') }
      end

      trait :with_clip do
        clip { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test.mp4'), 'video/mp4') }
      end

    end

end 
