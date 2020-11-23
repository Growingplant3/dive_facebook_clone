class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show]

  def index
    @pictures = Picture.all.order(created_at: "desc")
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:notice] = "新規登録に成功しました。"
      redirect_to pictures_path
    else
      flash[:alert] = "新規登録に失敗しました。"
      render :new
    end
  end

  def show
  end

  def confirm
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, user_attributes: [:id])
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
