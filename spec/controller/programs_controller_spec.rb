require 'rails_helper'

RSpec.describe ProgramsController, type: :controller do
  login_user
  
  describe "GET: programs#index" do
    before do
      get :index
    end

    it "1.) it is expected to render index template" do
      is_expected.to render_template(:index)
    end

    it '2.) is expected to assign program instance variable' do
      expect(assigns[:programs]).to eq(Program.all)
    end
  end

  describe "GET: programs#new" do
    before do
      get :new
    end

    it '3.) is expected to assign program as new instance variable' do
      expect(assigns[:program]).to be_instance_of(Program)
    end

    it '4.) is expected to assign courses instance variable' do
      expect(assigns[:course]).to eq(Course.all)
    end

    it '5.) is expected to assign batch instance variable' do
      expect(assigns[:batch]).to eq(Batch.all)
    end
  end

  describe "POST: courses#create" do
    before do
      post :create, params: params
    end
   
    context "when valid program is created" do
      let(:params) { { program: attributes_for(:program) } }
      it '6.) is expected to assign program as new instance variable' do
        expect(assigns[:program]).to be_instance_of(Program)
      end

      it '7.) is expected to have a course assigned' do
        expect(assigns[:program].course_id).to eq(1)
      end

      it '8.) is expected to have a batch assigned' do
        expect(assigns[:program].batch_id).to eq(1)
      end
      it '9.) is expected to redirect to index path' do
        is_expected.to redirect_to index_programs_path
      end
    end

    context "when invalid program is created" do
      let(:params) { { program: attributes_for(:program, :invalid_program) } } 
      it '10.) is expected to render new template' do
        is_expected.to render_template(:new)
      end
    end
  end

  describe "GET: programs#edit" do
    before do
      get :edit, params: params
    end
    let(:program) { create(:program) }
    let(:params) { { id: program.id } }
    it "11.) it is expected to render edit template" do
      is_expected.to render_template(:edit)
    end

    it '12.) is expected to assign program instance variable' do
      expect(assigns[:program]).to eq(Program.find(params[:id]))
    end

    it '13.) is expected to assign courses instance variable' do
      expect(assigns[:course]).to eq(Course.all)
    end

    it '14.) is expected to assign batch instance variable' do
      expect(assigns[:batch]).to eq(Batch.all)
    end
  end

  describe "PATCH: programs#update" do
    before do
      patch :update, params: params
    end
    let(:program) { create(:program) }
    let(:user_student) {create(:user, :generate_user, :student)}
    let(:user_instructor) {create(:user, :generate_user, :instructor)}
    let(:params) { { id: program.id, program: program_params, query_student: user_student.email, query_instructor: user_instructor.email} }
    let(:program_params) {attributes_for(:program)}
    it '15.) is expected to set program instance variable' do
      expect(assigns[:program]).to eq(Program.find(params[:id]))
    end

    context "when data is valid" do
      let(:program_params) {attributes_for(:program, :edited_program)}
      it "16.) it is expected to save valid program" do
        is_expected.to redirect_to index_programs_path
      end
    end

    context "when data is invalid" do
      let(:program_params) {attributes_for(:program, :invalid_program)}
      it "17.) it is expected not to save invalid program" do
        is_expected.to render_template(:edit)
      end
    end
  end

   
  describe "GET: programs#show" do
    before do
      get :show, params: params
    end
    let(:params) {{id: create(:program).id}}

    it "18.) it is expected to render show template" do
      is_expected.to render_template(:show)
    end

    it '19.) is expected to assign program instance variable' do
      expect(assigns[:program]).to eq(Program.all.first)
    end

    it '20.) is expected to assign program instance variable' do
      expect(assigns[:program].course).to eq(Course.all.first)
    end

    it '21.) is expected to assign program instance variable' do
      expect(assigns[:program].batch).to eq(Batch.all.first)
    end

    it '22.) is expected to assign program instance variable' do
      expect(assigns[:program].users.empty?).to eq(true)
    end
  end
end
