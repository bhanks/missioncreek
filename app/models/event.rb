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

  def no_headliner?
    !self.artists.map(&:headliner).reduce(&:|)
  end
  
  # def header
  #   unless(self.display_title || self.no_headliner?)
  #     self.artists.map()
  #   elsif(self.display_title)
  #     self.title
  #   end
  # end

  def headliners
    artists = self.artists
    headliners = self.artists.partition{|a| a.headliner}
    sorted =  headliners[0].sort{|a,b| a[:display_order] <=> b[:display_order]}
  end

  def support
    artists = self.artists
    support = self.artists.partition{|a| a.headliner}
    sorted =  support[1].sort{|a,b| a[:display_order] <=> b[:display_order]}
  end

end
