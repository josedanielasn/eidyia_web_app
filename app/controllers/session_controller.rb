class BatchController < ApplicationController
    before_action :session_params, only: [ :create, :update, :show, :edit]
   
    def index
      @session = Session.all
    end
    
    def new
      @session_new = Session.new
    end

    def create
        @session_create = Session.create(session_params)

        if @session_create.save
            redirect_to session_index_url
        else
            flash[:notice] =  'An error occured while saving'
            redirect_to new_session_url    
        end
    end
    
    def show
       @session = Session.find_by(session_params)
    end

    def edit
       @session = Session.find_by(session_params)

    end

    def update
        @session = Session.find(params[:id])
        if @session
            @session.update(session_params)
            redirect_to show_session_url
        else
            flash[:errors] = @user.errors.full_messages 
            redirect_to  edit_session_url  
        end
    end

    private
    def session_params
        params.permit(:session_name, :id, :program_id)
    end
end
