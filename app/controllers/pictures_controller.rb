class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]

  def index
    @pictures = Picture.all.order(created_at: "desc")
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        flash[:notice] = "新規登録に成功しました。"
        redirect_to pictures_path
      else
        flash[:alert] = "新規登録に失敗しました。"
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to pictures_path
    else
      flash[:alert] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to pictures_path
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, user_attributes: [:id])
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
