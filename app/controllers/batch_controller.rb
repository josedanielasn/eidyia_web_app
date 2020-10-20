class BatchController < ApplicationController
    before_action :batch_params, only: [ :create, :update, :show, :edit]
   
    def index
      @batches = Batch.all
      @batch = Batch.new
    end
    
    def new
      @batch_new = Batch.new
    end

    def create
        @batch = Batch.new(batch_params)
        respond_to do |format|
            if @batch.save
                 format.js
                 format.html { redirect_to batch_index_url }
            else
                flash[:notice] =  'An error occured while saving'
                redirect_to new_batch_url    

            end
        end
    end
    
    def show
        @batch = Batch.find_by(batch_params)
    end

    def edit
        @batch = Batch.find_by(batch_params)

    end

    def update
        @batch = Batch.find(params[:id])
        if @batch
            @batch.update(batch_params)
            redirect_to show_batch_url
        else
            flash[:errors] = @user.errors.full_messages 
            redirect_to  edit_batch_url  
        end
    end

    private
    def batch_params
        params.permit(:batch_name, :id)
    end
end
