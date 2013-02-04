class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  attr_accessible :body, :display_order, :title, :splash_image, :parent, :feature_order
	mount_uploader :splash_image, PageImageUploader

  def formatted_body
  	RedCloth.new(self.body).to_html
  end

  def self.all_except(id)
  	where("id != ?", id)
  end
  
  def self.children(id)
  	where("parent = ?", id)
  end

end
