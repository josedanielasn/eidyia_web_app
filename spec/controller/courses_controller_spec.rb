require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  login_user

  describe "GET: courses#index" do
    before do
      get :index
    end

    it "1.) it is expected to render index template" do
      is_expected.to render_template(:index)
    end

    it '2.) is expected to assign courses instance variable' do
      expect(assigns[:courses]).to eq(Course.all)
    end

    it '3.) is expected to assign course as new instance variable' do
      expect(assigns[:course]).to be_instance_of(Course)
    end
  end

  describe "POST: courses#create" do
    before do
      post :create, params: params
    end
   
    context "when valid course is created" do
      let(:params) { { course: attributes_for(:course) } }
      it '4.) is expected to assign course as new instance variable' do
        expect(assigns[:course]).to be_instance_of(Course)
      end

      it '5.) is expected to have name assigned to it' do
        expect(assigns[:course].course_name).to eq('ruby')
      end

      it '6.) is expected to redirect to index path' do
        is_expected.to redirect_to index_courses_path
      end
    end

    context "when invalid course is created" do
      let(:params) { { course: attributes_for(:course, course_name:'') } }
      it '7.) it is expected to render index template' do
        is_expected.to render_template(:index)
      end
    end
  end

   describe "GET: courses#edit" do
    before do
      get :edit, params: params
    end
    let(:course) { create(:course) }
    let(:params) { { id: course.id } }
    it "8.) it is expected to render edit template" do
      is_expected.to render_template(:edit)
    end

    it '9.) is expected to assign courses instance variable' do
      expect(assigns[:courses]).to eq(Course.all)
    end

    it '10.) is expected to set course instance variable' do
      expect(assigns[:course]).to eq(Course.find(params[:id]))
    end
  end

  describe "PATCH: courses#update" do
    before do
      post :update, params: params
    end
    let(:course) { create(:course) }
    let(:params) { { id: course.id, course: attributes_for(:course) } }
    
    it '11.) is expected to set course instance variable' do
      expect(assigns[:course]).to eq(Course.find(params[:id]))
    end

    context "when data is valid" do
      let(:params) { { id: course.id, course: attributes_for(:course, :edited_course) } }
      it "12.) it is expected to save valid course_name" do
        is_expected.to redirect_to index_courses_path
      end
    end

    context "when data is invalid" do
      let(:params) { { id: course.id, course: attributes_for(:course, :invalid_course_name) } }
      it "13.) it is expected to valid course_name" do
        is_expected.to render_template(:edit)
      end
    end
    
  end
  
end
