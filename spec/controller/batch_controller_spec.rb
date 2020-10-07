require 'rails_helper'

RSpec.describe BatchController, type: :controller do

    login_user

    describe 'GET batch#index' do
        before do
          get :index
        end
    
        it '1. is expected to assign batch instance variable' do
          expect(assigns[:batch]).to eq(Batch.all)
        end
    end

    describe 'GET batch#new' do
        before do
          get :new
        end
        
        context "when initialized" do
          subject(:batch) { Batch.new }
      
          it "1. is expected to initialized a new batch" do
            expect(batch).to be_a_new(Batch)
          end
  
          it '2. is expected to render a new template' do
              is_expected.to render_template(:new)
          end
        end
    
    end

    describe "POST batch#create" do
        context 'when params is valid' do

          it '1. create batch with valid attributes' do
            batch_params = { batch: {batch_name: 'batch1'}}
            post :create, :params => batch_params
            expect(response).to have_http_status(302)
          end
      end 
    end
  
    describe 'GET batch#show' do
      before do
        get :show, params: params
      end
  
      context 'when batch id is valid' do
        let(:batch) { FactoryBot.create :batch }
        let(:params) { { id: batch.id } }
  
        it '1. is expected to set batch instance variable' do
          expect(assigns[:batch]).to eq(Batch.find_by(id: params[:id]))
        end
  
        it '2. is expected to render show template' do
          is_expected.to render_template(:show)
        end
      end
    end


    describe 'GET batch#edit' do
        before do
          get :edit, params: params
        end
    
        context 'when batch id is valid' do
          let(:batch) { FactoryBot.create :batch }
          let(:params) { { id: batch.id } }
    
          it '1. is expected to set batch instance variable' do
            expect(assigns[:batch]).to eq(Batch.find_by(id: params[:id]))
          end
    
          it '2. is expected to render edit template' do
            is_expected.to render_template(:edit)
          end
        end
      end

    describe 'PATCH batch#update' do

        before do
           patch :update, params: params
        end
    
        context 'when batch exist in database' do
        let(:batch) { FactoryBot.create :batch }
        let(:params) { { id: batch.id } }

            context 'when data is provided is valid' do
                it '1. is expected to update batch name' do
                    expect(batch.reload.batch_name).to eq('batch_name')
                end

                it '2. is_expected to redirect_to users_path' do
                    is_expected.to redirect_to(show_batch_url)
                end
            end
        end
    end
end
