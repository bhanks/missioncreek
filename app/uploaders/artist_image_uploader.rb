# encoding: utf-8

class ArtistImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "artist/#{ENV['MEDIA_LOCATION']}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  #process :resize_to_fit => [600, 450]
  #
  # def scale(width, height)
  #    # do something
  #    process :res
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :crop
    process :resize_to_fit => [150, 100]
  end

  version :small do
    process :crop
    process :resize_to_fit => [300, 200]
  end

  version :large do
    process :crop
    process :resize_to_fit => [600, 400]
  end


  version :medium do
    process :crop
    process :resize_to_fit => [450, 300]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    if original_filename
      ext = original_filename.match(/\.(jpg|jpeg|png)/)[1]
      model.name.gsub(/\s/,"_")+".#{ext}"
    end
  end

  def crop
    if model.crop_x.present?
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x,y,w,h)
      end
    end
  end

end
