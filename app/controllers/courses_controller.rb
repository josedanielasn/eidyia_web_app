class CoursesController < ApplicationController
  before_action :admin_user
  
  def index 
      @courses = Course.all
      @course = Course.new  
  end

  def create
    @course = Course.new(courses_params)
    
      if @course.save
        redirect_to index_courses_path
      else
        flash[:notice] =  'An error occured while saving'
        redirect_to index_courses_path
      end
 
  end

  def edit
    @courses = Course.all
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
   if @course.update(courses_params)
    redirect_to index_courses_path
   else
    flash[:notice] =  'An error occured while saving'
    redirect_to index_courses_path
   end
  end

  private

  def courses_params 
    params.require(:course).permit(:course_name)
  end
end
