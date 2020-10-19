class CoursesController < ApplicationController

  def index
    @courses = Course.all
    @course = Course.new
  end

  def create
    @course = Course.new(courses_params)
    respond_to do |format|
      if @course.save
        format.js
        format.html { redirect_to index_courses_path}

      else
        render 'index'
      end
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
    render 'edit'
   end
  end

  private

  def courses_params 
    params.require(:course).permit(:course_name)
  end
end
