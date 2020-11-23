class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order(created_at: "desc")
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:notice] = "新規登録に成功しました。"
      redirect_to pictures_path
    else
      flash[:alert] = "新規登録に失敗しました。"
      render :new
    end
  end

  def confirm
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image)
  end
end
