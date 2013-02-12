class Venue < ActiveRecord::Base
  attr_accessible :address, :name, :url
  has_many :events
end
