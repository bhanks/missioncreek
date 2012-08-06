class Artist < ActiveRecord::Base
  attr_accessible :name, :bio, :soundcloud_url, :official_url, :youtube_url, :order, :tier, :image
  validates_presence_of :name, :tier
  mount_uploader :image, ArtistImageUploader
  
end
