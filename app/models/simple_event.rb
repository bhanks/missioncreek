class SimpleEvent < ActiveRecord::Base
  attr_accessible :date, :description, :free, :image, :price, :soldout, :start, :ticket_url, :title, :category, :venue_id
  belongs_to :venue
end
