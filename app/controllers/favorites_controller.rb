class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    work = Work.find(params[:work_id])
    current_user.favorite(work)
    flash[:success] = "作品をお気に入りに登録しました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    work = Work.find(params[:work_id])
    current_user.unfavorite(work)
    flash[:success] = "作品をお気に入りから外しました"
    redirect_back(fallback_location: root_path)
  end
end
