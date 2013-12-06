object @artist
attributes :id, :name
node :tokens do |a|
  a.name.split(" ").reject{|s| s.downcase == 'the'}
end
