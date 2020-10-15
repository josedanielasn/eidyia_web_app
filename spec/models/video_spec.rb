require 'rails_helper'

RSpec.describe Video, type: :model do
    describe 'Validations' do

        context 'when uploading a video' do
            let(:video) { create :video }
    
            it '1.) is not valid without a video title' do
                video = build(:video, video_title: '', video_description: 'video description')
                expect(video.valid?).to eq(false)  
            end

            it '2.) is not valid without a video description' do
                video = build(:video, video_title: 'video title', video_description: '')
                expect(video.valid?).to eq(false)  
            end

            it '3.) is not valid if video title has less than 2 characters' do
                video = build(:video, video_title: 'v', video_description: 'video description')
                expect(video.valid?).to eq(false)  
            end

            it '4.) is not valid if video title has more than 30 characters' do
                video = build(:video, video_title: 'v'*31, video_description: 'video description')
                expect(video.valid?).to eq(false)  
            end

            it '5.) is not valid if video description has less than 2 characters' do
                video = build(:video, video_title: 'video title', video_description: 'v')
                expect(video.valid?).to eq(false)  
            end

            it '6.) is not valid if video description has more than 200 characters' do
                video = build(:video, video_title: 'video title', video_description: 'v'*201)
                expect(video.valid?).to eq(false)  
            end

        end
    end
end
