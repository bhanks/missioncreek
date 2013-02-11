class Event < ActiveRecord::Base
  attr_accessible :date, :description, :door_time, :free, :price_advance, :price_dayof, :soldout, :start_time, :ticket_url, :title
end
