module PicturesHelper
  def choose_pictures_path
    case action_name
    when "new","create","confirm"
      confirm_pictures_path
    when "edit","update" 
      picture_path
    end
  end
end
