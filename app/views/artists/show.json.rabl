object @artist
attributes :id, :name, :event_id
node :tokens do |a|
  a.name.split(" ").reject{|s| s.downcase == 'the'}
end
