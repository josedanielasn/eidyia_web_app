require 'rails_helper'

RSpec.describe VideoController, type: :controller do

    login_user

    describe 'GET: video#index' do
        before do
          get :index
        end
    
        it '1.)It is expected to assign video instance variable' do
          expect(assigns[:videos]).to eq(Video.all)
        end
        it "2.)renders the index view" do
            get :index
            expect(response).to render_template("index")
        end
    end
end
