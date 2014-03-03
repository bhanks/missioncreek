collection @events, :object_root => false
attributes :id, :date, :description
attributes :start_time => :time, :price_advance => :price_low, :price_dayof => :price_high
node :title do |e|
  if e.title && e.show_title
     e.title
  else
     title = e.headliners.map(&:name).join(",")
     title += " with #{e.support.map(&:name).join(",")}" if e.support != []
     title
  end
end
node :venue do |e|
  e.venue.name
end
node :venue_addr do |e|
  e.venue.address
end
