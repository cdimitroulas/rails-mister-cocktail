module BackgroundHelper

  def set_background(photo)
    if photo.blank?
      image_path "cocktailHD.jpg"
    else
      cl_image_path photo, width: 280, height: 200, crop: :fill
    end
  end
end
