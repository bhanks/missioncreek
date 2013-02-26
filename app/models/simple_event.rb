class SimpleEvent < ActiveRecord::Base
  attr_accessible :date, :description, :free, :image, :price, :soldout, :start, :ticket_url, :title, :type, :venue_id
  belongs_to :venue
end
