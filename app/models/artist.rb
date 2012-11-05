class Artist < ActiveRecord::Base
  attr_accessible :name, :bio, :soundcloud_url, :official_url, :youtube_url, :order, :tier, :image
  validates_presence_of :name, :tier
  mount_uploader :image, ArtistImageUploader

  before_save :clean_urls

  def clean_urls
  	if !self.youtube_url.empty?
  		self.youtube_url = self.youtube_url.gsub("\"","'").match(/https?:\/\/[\S]+/)[0]
  	end
  	if !self.soundcloud_url.empty?
  		self.soundcloud_url = self.soundcloud_url.gsub("\"","'").match(/https?:\/\/[\S]+/)[0]
  	end
  end
  
end
