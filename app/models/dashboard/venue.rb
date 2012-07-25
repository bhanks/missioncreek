class Dashboard::Venue < ActiveRecord::Base
  attr_accessible :address, :name, :url
end
