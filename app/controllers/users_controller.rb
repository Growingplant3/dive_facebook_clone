class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "アカウントを作成しました。"
      redirect_to new_session_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:notice] = "アカウントを削除しました。"
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
