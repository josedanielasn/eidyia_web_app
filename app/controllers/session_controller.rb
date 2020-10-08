class SessionController < ApplicationController
    before_action :session_params, only: [ :create, :update, :show, :edit]
   
    def index
      @sessions = Session.all
    end
    
    def new
      @session_new = Session.new
    end

    def create
        @program = Program.create(course_id: params[:course][:course_id], batch_id: params[:batch][:batch_id])
        if @program.valid?
            
            @program.save
            @session_create = Session.create(session_name: params[:session_name], program_id: @program.id)
            @session_create.save

            redirect_to session_index_url
        else
            flash[:notice] =  'An error occured while creating'
            redirect_to new_session_url    
        end
    end
    
    def show
       @session = Session.find_by(session_params)    
    end

    def edit
       @session = Session.find_by(session_params)
       @program = Program.find(@session.program.id)
    
    end

    def update
        @session = Session.find(params[:id])
        @program = Program.find(@session.program.id)
       
        if @session
            @program.update(course_id: params[:course][:course_id], batch_id: params[:batch][:batch_id] )
            @session.update(session_params)
            redirect_to show_session_url
        else
            flash[:notice] = "An error occured while updating" 
            redirect_to  edit_session_url  
        end
    end

    private
    def session_params
        params.permit(:session_name, :id, :course_id, :batch_id)
    end
end
