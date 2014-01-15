class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  acts_as_taggable
  acts_as_taggable_on :category
  attr_accessible :name, :bio, :soundcloud_url, :official_url, :youtube_url, :display_order, :tier, :image, :spotify_url, :headliner, :event_id, :lit_fest, :event_order, :featured
  attr_accessible :facebook_url, :twitter_url
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  validates_presence_of :name
  belongs_to :event
  mount_uploader :image, ArtistImageUploader

  after_update :perform_crop
  # before_save :clean_urls

  def perform_crop
    image.recreate_versions! if crop_x.present?
  end
  def get_image
    self.image.url ||= asset_path("no-image.png")
  end

  def clean_urls
  	if !self.youtube_url.nil? && !self.youtube_url.empty?
  		self.youtube_url = self.youtube_url.match(/https?:\/\/[\S]+/)[0].gsub("\"","")
  	end
  	if !self.soundcloud_url.nil? && !self.soundcloud_url.empty?
  		self.soundcloud_url = self.soundcloud_url.gsub("\"","'").match(/https?:\/\/[\S]+/)[0]
  	end

  end

  def self.get_by_tier(tier)
    where(:tier => tier)
  end
  


end
