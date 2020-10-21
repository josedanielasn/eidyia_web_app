class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
    @comment = Comment.new
    @comments = @video.comments.order("created_at DESC")
    gon.username = current_user.username
  end

  def new
    @video = Video.new
    @session = Session.all

  end

  def edit
  end

  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @video.comments.count === 0
      @video.destroy
      respond_to do |format|
        format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to videos_url, notice: 'Video was not destroyed.' }
      end
    end
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:video_title, :video_description, :clip, :thumbnail, :session_id)
    end
end
