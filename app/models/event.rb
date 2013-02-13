class Event < ActiveRecord::Base
  attr_accessible :date, :description, :door_time, :free, :price_advance, :price_dayof, :show_title
  attr_accessible :venue_id, :soldout, :start_time, :ticket_url, :title, :artists_attributes
  belongs_to :venue
  has_many :artists
  accepts_nested_attributes_for :artists

  def format_door_time
  	if(self.door_time.strftime("%M")=="00")
  		self.door_time.strftime("%l %P")
  	else
  		self.door_time.strftime("%l%M %P")
  	end
  end

  def format_start_time
  	if(self.start_time.strftime("%M")=="00")
  		self.start_time.strftime("%l %P")
  	else
  		self.start_time.strftime("%l%M %P")
  	end
  end

  def format_date
  	self.date.strftime("%A %b %e")
  end

end
