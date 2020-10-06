require 'rails_helper'

RSpec.describe BatchController, type: :controller do

    login_user

    describe 'GET #index' do
        before do
          get :index
        end
    
        it 'is expected to assign batch instance variable' do
          expect(assigns[:batch]).to eq(Batch.all)
        end
    end

    describe 'GET #new' do
        before do
          get :new
        end
    
        it 'renders new template' do
          is_expected.to render_template(:new)
        end
    
      end

    describe 'GET #edit' do
        before do
          get :edit, params: params
        end
    
        context 'when batch id is valid' do
          let(:batch) { FactoryBot.create :batch }
          let(:params) { { id: batch.id } }
    
          it 'is expected to set batch instance variable' do
            expect(assigns[:batch]).to eq(Batch.find_by(id: params[:id]))
          end
    
          it 'is expected to render edit template' do
            is_expected.to render_template(:edit)
          end
        end
      end

    describe 'PATCH #update' do

        before do
        patch :update, params: params
        end
    
        context 'when batch exist in database' do
        let(:batch) { FactoryBot.create :batch }
        let(:params) { { id: batch.id, batch: { batch: 'batch_name' } } }

            context 'when data is provided is valid' do
                it 'is expected to update batch name' do
                expect(batch.reload.batch_name).to eq('batch_name')
                end

                it 'is_expected to redirect_to users_path' do
                is_expected.to redirect_to(show_batch_url)
                end
            end
        end
    end


    describe "should go to index" do
        it "it has a 200 status code" do
          get :index
          expect(response.status).to eq(200)
        end
    end

    describe "should create a batch " do
        it "it should redirect to index if post route is succesfull" do
            post :create, :params => { :batch => { :batch_name => "batch_name" } }
            expect(response.status).to eq(302)
        end
    end   
    

end
