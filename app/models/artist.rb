class Artist < ActiveRecord::Base
  attr_accessible :name, :bio, :soundcloud_url, :official_url, :youtube_url, :order, :tier
  validates_presence_of :name

  
end
