class BatchController < ApplicationController
    before_action :batch_params, only: [ :create, :update, :show, :edit]
    before_action :admin_user
    def index
      @batches = Batch.all
      @batch = Batch.new
    end
    
    def new
      @batch_new = Batch.new
    end

    def create
        @batch = Batch.new(batch_params)
        if @batch.save
          
            redirect_to batch_index_url 
        else
            flash[:notice] =   @batch.errors.full_messages
            redirect_to batch_index_url 
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
            flash[:errors] = @batch.errors.full_messages 
            redirect_to  edit_batch_url  
        end
    end

    private
    def batch_params
        params.require(:batch).permit(:batch_name, :id)
    end
end
