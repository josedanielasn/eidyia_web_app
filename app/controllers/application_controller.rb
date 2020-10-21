class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def login_instructor?
    current_user.role == "instructor"
  end
  
  def login_student?
    current_user.role == "student"
  end

  def login_admin?
    current_user.role == "admin"
  end

  def admin_user
    redirect_to index_announcement_path unless current_user.role == 'admin' 
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :lastname, :role])
  end
end
