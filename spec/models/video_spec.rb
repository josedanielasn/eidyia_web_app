require 'rails_helper'

RSpec.describe Video, type: :model do
    describe 'Validations' do

        context 'when uploading a video' do
            let(:video) { create :video }
    
            it '1.) it is not valid without a video title' do
                video = build(:video, video_title: '', video_description: 'video description')
                expect(video.valid?).to eq(false)  
            end

            it '1.) it is not valid without a video description' do
                video = build(:video, video_title: 'video title', video_description: '')
                expect(video.valid?).to eq(false)  
            end

        end
    end
end
