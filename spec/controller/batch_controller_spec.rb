require 'rails_helper'

RSpec.describe BatchController, type: :controller do

    login_user

    describe 'GET: batch#index' do
        before do
          get :index
        end
    
        it '1.) is expected to assign batch instance variable' do
          expect(assigns[:batch]).to eq(Batch.all)
        end
    end

    describe 'GET: batch#new' do
        before do
          get :new
        end
        
        context "when initialized" do
          subject(:batch) { Batch.new }
      
          it "2.) is expected to initialized a new batch" do
            expect(batch).to be_a_new(Batch)
          end
  
          it '3.) is expected to render a new template' do
              is_expected.to render_template(:new)
          end
        end
    
    end

    describe "POST: batch#create" do
        context 'when params is valid' do
          it '4.) create batch with valid attributes' do
            batch_params =  {  batch: attributes_for(:batch) } 
            post :create, :params => batch_params
            expect(response).to have_http_status(302)
          end

          context 'when params is invalid' do
            it '5.) should redirect to new page' do
              batch_params =  {  batch: attributes_for(:batch, :invalid_batch_name) } 
              post :create, :params => batch_params
              expect(response).to have_http_status(302)
            end
          end 

      end 
    end
  
    describe 'GET: batch#show' do
      before do
        get :show, params: params
      end
  
      context 'when batch id is valid' do
        let(:batch) {create(:batch)}
        let(:params) { { id: batch.id} }
  
        it '6.) is expected to set batch instance variable' do
          expect(assigns[:batch]).to eq(Batch.find(params[:id]))
        end
  
        it '7.) is expected to render show template' do
          is_expected.to render_template(:show)
        end
      end
    end


    describe 'GET: batch#edit' do
        before do
          get :edit, params: params
        end
    
        context 'when batch id is valid' do
          let(:batch) {create(:batch)}
          let(:params) { { id: batch.id } }

    
          it '8.) is expected to set batch instance variable' do
            expect(assigns[:batch]).to eq(Batch.find_by(id: params[:id]))
          end
    
          it '9.) is expected to render edit template' do
            is_expected.to render_template(:edit)
          end
        end
      end

    describe 'PATCH: batch#update' do
      before do
        patch :update, params: params
      end
        context 'when batch exist in database' do
        let(:batch) {create(:batch)}
         let(:params) { {id:  batch.id}}

            context 'when data is provided is valid' do
                it '10.) is expected to update batch name' do
                  expect(batch.reload.batch_name).to eq('batch_name')
                end

                it '11.) is_expected to redirect_to users_path' do
                    is_expected.to redirect_to(show_batch_url)
                end
            end

            context 'when params is invalid' do
              let(:invalid_batch)  { { batch: attributes_for(:batch, :invalid_batch_name) }} 
             
              it '12.) should redirect to edit page' do
                expect(response).to have_http_status(302)
              end
            end 
        end
    end
end
