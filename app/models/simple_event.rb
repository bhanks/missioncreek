class SimpleEvent < ActiveRecord::Base
  attr_accessible :date, :description, :free, :image, :price, :soldout, :start, :ticket_url, :title, :category, :venue_id
  mount_uploader :image, SimpleEventImageUploader
  belongs_to :venue

  def display_price
	price = ""
	unless self.free || self.soldout
		price = self.price
	else
		price = (self.free) ? "This is event is FREE" : "This event is SOLDOUT"
	end
	price
  end
end
