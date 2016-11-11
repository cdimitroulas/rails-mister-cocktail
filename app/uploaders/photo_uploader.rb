class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    resize_to_fit 270, 200
  end

  def public_id
    return "mister-cocktail/" + model.name
  end
end
