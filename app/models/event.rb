class Event < ActiveRecord::Base
  attr_accessible :date, :description, :door_time, :free, :price_advance, :price_dayof
  attr_accessible :venue_id, :soldout, :start_time, :ticket_url, :title, :artists_attributes
  belongs_to :venue
  has_many :artists
  accepts_nested_attributes_for :artists

end
