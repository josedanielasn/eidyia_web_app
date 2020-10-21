class UsersController < ApplicationController
  before_action :admin_user, except: :show

  def index
    @user = User.new()
    if params[:user_identity] == 'student'
      @users =  User.where(role: 'student')
    elsif params[:user_identity] == 'instructor'
      @users = User.where(role: 'instructor')
    end
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new()
  end

  def create
    @params = params_users
    @params['role'] = @params['role'].to_i
    @user = User.new(@params)
    #byebug
    if @user.save
      redirect_to index_users_path(user_identity: @user.role)
    else
      flash[:notice] =  'An error occured while saving'
      redirect_to index_users_path(user_identity: @user.role)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @params = params_users
    #byebug
    params_users[:role] = params_users[:role].to_i
     
    if @user.update(params_users)
      redirect_to index_users_path(user_identity: @user.role)
    else
      flash[:notice] =  'An error occured while saving'
      redirect_to index_users_path(user_identity: @user.role)
    end
   

  end

  private
  def params_users
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :role)
  end
end
