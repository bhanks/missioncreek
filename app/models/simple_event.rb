class SimpleEvent < ActiveRecord::Base
  attr_accessible :date, :description, :free, :image, :price, :soldout, :start, :ticket_url, :title, :category, :venue_id
  mount_uploader :image, SimpleEventImageUploader
  belongs_to :venue
end
