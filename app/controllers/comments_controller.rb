class CommentsController < ApplicationController
  before_action :require_user_logged_in
  def create
    @work = Work.find(params[:work_id])
    @comment = current_user.comments.build(work_id: params[:work_id], content: params[:comment][:content])
    # current_user.comment(@work, @comment.content)
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:work_id, :comment, :content)
  end
end
