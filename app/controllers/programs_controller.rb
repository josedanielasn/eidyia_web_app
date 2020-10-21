class ProgramsController < ApplicationController
  def index
    @programs = Program.all
    @program_new = Program.new
    @course = Course.all
    @batch = Batch.all
  end

  def new
    @program = Program.new
    @course = Course.all
    @batch = Batch.all
  end

  def create
    @program = Program.new(program_params)
        if @program.save 
          redirect_to index_programs_path
        else
          flash[:notice] =  'An error occured while saving'
          redirect_to index_programs_path
        end
  end

  def show
    @program = Program.find(params[:id])
    @batch = @program.batch.batch_name
    @course = @program.course.course_name
    @instructors = @program.users.select {|user| user.role == 'instructor'}
    @students = @program.users.select {|user| user.role == 'student'}
  end

  def edit
    @program = Program.find(params[:id])
    @course = Course.all
    @batch = Batch.all
  end

  def update
    @student = User.find_by(email: params[:query_student])
    @instructor = User.find_by(email: params[:query_instructor])
    @program = Program.find(params[:id])
    @program.users << [@student, @instructor]
    if @program.update(program_params) 
      redirect_to index_programs_path
    else
      render 'edit'
    end
  end

  private 
  def program_params
    params.require(:program).permit(:batch_id, :course_id, users:[])
  end
end
