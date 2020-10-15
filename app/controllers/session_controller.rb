class SessionController < ApplicationController
    def index
      @sessions = Session.all
    end
    
    def new
      @session_new = Session.new
      @program = Program.all

    end

    def create
        @session_create = Session.create(session_params)

        if @session_create.valid?            
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
       @program = Program.all   
       @get_program = @session.program.id
    
    end

    def update
        @session = Session.find(params[:id])
       
        if @session.valid? 
         
            @session.update(session_params)
            redirect_to show_session_url
        else
            flash[:notice] = "An error occured while updating" 
            redirect_to  edit_session_url  
        end
    end

    private
    def session_params
        params.permit(:session_name, :id, :program_id)
    end
end
