class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="ユーザーを登録しました"
      redirect_to @user
    else
      flash[:danger]="ユーザーの登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]="更新しました"
      redirect_to @user
    else
      flash[:danger]="更新に失敗しました"
      render :edit
    end
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmaion, :profile)
end