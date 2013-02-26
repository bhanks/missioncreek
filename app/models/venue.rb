class Venue < ActiveRecord::Base
  attr_accessible :address, :name, :url
  has_many :events
  has_many :simple_events
end
