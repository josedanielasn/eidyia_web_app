require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  describe 'GET: users#index' do
    before do
      get :index
    end

    it '1.) is expected to assign users instance variable' do
      expect(assigns[:users]).to eq(User.all)
    end
    it "2.)is expected to render the index view" do
        expect(response).to render_template("index")
    end
  end

  describe 'GET: users#show' do
    before do
      get :show, params: params
    end
    let(:params){{id: create(:user, :another_uniq_user).id}}
    it '3.) is expected to assign user instance variable' do
      expect(assigns[:user]).to eq(User.find(params[:id]))
    end
    it "4.) is expected to render the show view" do
        expect(response).to render_template("show")
    end
  end

  describe 'GET: users#new' do
    before do
      get :new
    end
    
    it '5.) is expected to assign user as a new instance variable' do
      expect(assigns[:user]).to be_instance_of(User)
    end

    it "6.)is expected to render the new view" do
      expect(response).to render_template("new")
    end
  end

  describe 'POST: users#create' do
    before do
      post :create, params: params
    end
    let(:user){create(:user, :generate_user, :admin)}
    let(:params) {{user: user.attributes}}

    it '7.) it is expected to assign user as a new instance variable' do
        expect(assigns[:user]).to be_instance_of(User)
    end
    context 'when valid user is created' do
      it '8.) is to save to user' do
        expect(user).to eq(User.find(params[:user]['id']))
      end
      it '9.) is expected to redirect to index path' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when invalid user is created' do
      let(:user){build(:user, :generate_user, :invalid_firstname)}
      it '10.) is expected to redirect to index path' do
        expect(response).to render_template("new")
      end
    end
    
  end

  describe 'GET: users#edit' do
    before do
      get :edit, params: params
    end
    let(:user){create(:user, :generate_user, :admin)}
    let(:params) {{id: user.id ,user: user.attributes}}

    it '11.) is expected to assign user as a new instance variable' do
      expect(assigns[:user]).to eq(User.find(params[:id]))
    end

    it "12.)renders the edit view" do
      expect(response).to render_template("edit")
    end
  end

  describe "PATCH: users#update" do
    before do
      patch :update, params: params
    end
    let(:user){create(:user, :generate_user, :admin)}
    let(:params) {{id: user.id ,user: user.attributes}}

    it '13.) is expected to assign user as a new instance variable' do
      expect(assigns[:user]).to eq(User.find(params[:id]))
    end 
    
    context "when data is valid" do
      let(:params) { { id: user.id, user: attributes_for(:user, :generate_user, :student) } }
      it "14.) it is expected to save valid user" do
        is_expected.to redirect_to show_users_path(params[:id])
      end
    end

    context "when data is invalid" do
      let(:params) { { id: user.id, user: attributes_for(:user, :generate_user, :invalid_firstname) } }
      it "15.) it is expected to save valid user" do
        is_expected.to render_template(:edit)
      end
    end
  end
end
