require 'rails_helper'

RSpec.describe SessionController, type: :controller do

    login_user

    describe 'GET: session#index' do
        before do
          get :index
        end
    
        it '1.) is expected to assign session instance variable' do
          expect(assigns[:sessions]).to eq(Session.all)
        end
        it "2.)renders the index view" do
            get :index
            expect(response).to render_template("index")
        end
    end

    describe 'GET: session#new' do
        before do
          get :new
        end
        
        context "when initialized" do
          subject(:sessions) { Session.new }
      
          it "1.) is expected to initialized a new session" do
            expect(sessions).to be_a_new(Session)
          end
          it '2.) is expected to render a new template' do
              is_expected.to render_template(:new)
          end
        end
    
    end

    describe "POST: sesion#create" do
        context 'when params is valid' do
          let(:program) { create :program }
          let(:session) { create :session }
          
          it '1.) create program with valid attributes' do
            program_params = { course_id: program.course_id, batch_id: program.batch_id}
            post :create, :params => program_params

            expect(response).to have_http_status(302)
          end
          it '2.) create session with valid attributes' do
            session_params = { session: {session_name: session.session_name, program_id: session.program_id}}
            post :create, :params => session_params

            expect(response).to have_http_status(302)
          end
      end 

        context 'when params is invalid' do
          it '1.) should redirect to new page' do
            session_params =  {  session: attributes_for(:session, :invalid_session_name) } 
            post :create, :params => session_params
            expect(response).to have_http_status(302)
          end
        end 
    end
  
    describe 'GET: session#show' do
      before do
        get :show, params: params
      end
  
      context 'when session id is valid' do
        let(:session) { create :session }
        let(:params) { { id: session.id } }
  
        it '1.) is expected to set session instance variable' do
          expect(assigns[:session]).to eq(Session.find_by(id: params[:id]))
        end
  
        it '2.) is expected to render show template' do
          is_expected.to render_template(:show)
        end
      end
    end


    describe 'GET: session#edit' do
        before do
          get :edit, params: params
        end
    
        context 'when session id is valid' do
          let(:session) { create :session }
          let(:params) { { id: session.id, program_id: session.program_id } }
    
          it '1.) is expected to set session instance variable' do          
            expect(assigns[:session]).to eq(Session.find_by(id: params[:id]))
           end
          it '2.) is expected to set program instance variable' do          
            expect(assigns[:program]).to eq(Program.find_by(id: params[:program_id]))
          end
          it '3.) is expected to render edit template' do
            is_expected.to render_template(:edit)
          end
        end
      end

    describe 'PATCH: session#update' do

        before do
           patch :update, params: params
        end
    
        context 'when session exist in database' do
        let(:session) { create :session }
        let(:program) { create :program }
        let(:params) { { id: session.id, program_id: session.program_id } }

            context 'when data is provided is valid' do
                it '1.) is expected to update session name' do
                    expect(session.reload.session_name).to eq('session_name')
                end
                it '2.) is expected to update program course_id' do
                  expect(program.reload.course_id).to eq(2)
                end
                it '3.) is expected to update program batch_id' do
                  expect(program.reload.batch_id).to eq(2)
                end
                it '4.) is_expected to redirect_to users_path' do
                    is_expected.to redirect_to(show_session_url)
                end
            end

            context 'when params is invalid' do
              let(:invalid_session)  { { session: attributes_for(:session, :invalid_session_name) }} 
             
              it '1.) should redirect to edit page' do
                expect(response).to have_http_status(302)
              end
            end 
        end
    end
end
