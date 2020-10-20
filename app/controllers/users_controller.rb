class UsersController < ApplicationController
  def index
    if params[:user_identity] == 'student'
      @users = User.all.select{|x| x.role =='student'} 
    elsif params[:user_identity] == 'instructor'
      @users = User.all.select{|x| x.role =='instructor'}
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @params = params_users
    @params['role'] = @params['role'].to_i
    @user = User.new(@params)
    if @user.save
      redirect_to index_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_users)
      redirect_to show_users_path(params[:id])
    else
      render 'edit'
    end
  end

  private
  def params_users
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :role)
  end
end
