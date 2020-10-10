class ProgramsController < ApplicationController
  def index
    @programs = Program.all
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
      render 'new'
    end
  end

  def edit
    @program = Program.find(params[:id])
    @course = Course.all
    @batch = Batch.all
  end

  def update
    @program = Program.find(params[:id])
    if @program.update(program_params) 
      redirect_to index_programs_path
    else
      render 'edit'
    end
  end

  private 
  def program_params
    params.require(:program).permit(:batch_id, :course_id)
  end
end
