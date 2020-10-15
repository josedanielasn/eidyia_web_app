require 'rails_helper'

RSpec.describe VideosController, type: :controller do

    login_user

    describe 'GET: video#index' do
      before do
        get :index
      end
  
      it '1.) is expected to assign video instance variable' do
        expect(assigns[:videos]).to eq(Video.all)
      end
      it "2.) renders the index view" do
          get :index
          expect(response).to render_template("index")
      end
    end

    describe 'GET: video#new' do
      before do
        get :new
      end
      
      context "when initialized" do
        subject(:videos) { Video.new }
    
        it "3.) is expected to initialized a new session" do
          expect(videos).to be_a_new(Video)
        end
        it '4.) is expected to render a new template' do
            is_expected.to render_template(:new)
        end
      end
    end

    describe "POST: video#create" do
      context 'when params is valid' do

        let(:video) { create :video }
        let(:video_thumbnail)  { { video: attributes_for(:video, :with_thumbnail) }} 
        let(:video_clip)  { { video: attributes_for(:video, :with_clip) }} 

        it '5.) create video with valid attributes' do
          video_params = { video: {video_title: video.video_title, video_description: video.video_description, session_id: video.session_id, thumbnail: video_thumbnail, clip: video_clip  }}
          post :create, :params => video_params

          expect(response).to have_http_status(302)
        end
      end  

      context 'when params is invalid' do
        it '6.) should not save' do
          video_params =  {  video: attributes_for(:video, :invalid_video_title) } 
          post :create, :params => video_params
          expect(response).to have_http_status(200)
        end
      end

    end

    describe 'GET: video#show' do
      before do
        get :show, params: params
      end
  
      context 'when video id is valid' do
        let(:video) { create :video }
        let(:params) { { id: video.id } }
  
        it '7.) is expected to set video instance variable' do
          expect(assigns[:video]).to eq(Video.find_by(id: params[:id]))
        end
  
        it '8.) is expected to render show template' do
          is_expected.to render_template(:show)
        end
      end
    end

    describe 'GET: video#edit' do
      before do
        get :edit, params: params
      end

      context 'when video id is valid' do
        let(:video) { create :video }
        let(:params) { { id: video.id, session_id: video.session_id } }

        it '9.) is expected to set video instance variable' do          
          expect(assigns[:video]).to eq(Video.find_by(id: params[:id]))
        end

        it '10.) is expected to render edit template' do
          is_expected.to render_template(:edit)
        end
      end
    end

    describe 'PATCH: video#update' do

      context 'when video exist in database' do

        let(:video) { create :video }
        let(:video_thumbnail)  { { video: attributes_for(:video, :with_thumbnail) }} 
        let(:video_clip)  { { video: attributes_for(:video, :with_clip) }} 

        it '11.) update the video with valid attributes' do
          patch :update, params: { id: video.id, video: attributes_for(:video, :edited_video_title) }
          
          expect(response).to have_http_status(302)
        end

      end
    end

    describe 'DELETE video#destroy' do

      let(:video) { create :video }
      let(:video_thumbnail)  { { video: attributes_for(:video, :with_thumbnail) }} 
      let(:video_clip)  { { video: attributes_for(:video, :with_clip) }} 

      it '12.) does not delete the video if it has no comments' do
        expect { delete :destroy, params: { id: video.id } }.to change{Video.count}.by(0) 
      end
    end

end
