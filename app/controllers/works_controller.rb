class WorksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def create
    @work = current_user.works.build(work_params)
    if @work.save
      flash[:success]="投稿しました"
      redirect_to root_url
    else
      @works = current_user.feed_works.order("created_at DESC").page(params[:page])
      flash.now[:danger]="投稿に失敗しました"
      render "users/new"
    end
  end

  def show
    @work = Work.find(params[:id])
    @comment = current_user.comments.build
    @comment_works = @work.comments.page(params[:page])
  end

  def destroy
    # if @work.comments.present?
    #   @work.comments.destroy
    # end
    # if current_user.favorite(@work)
    #   current_user.unfavorite(@work)
    # end
    
    @work.destroy
    flash[:success]="投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def work_params
    params.require(:work).permit(:title, :work_path, :caption, :image, :image_cache, :remove_image, :audio, :audio_cache, :remove_audio)
  end
  
  # def comment_params
  #   params.require(:comment).permit(:content)
  # end
  
  def correct_user
    @work = current_user.works.find_by(id: params[:id])
    unless @work
      redirect_to root_url
    end
  end
end
