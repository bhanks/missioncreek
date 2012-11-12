# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# "JUSTIN TOWNES EARLE".downcase.split(" ").map(&:capitalize).join(" ")

Artist.delete_all

tier_one = [
	"THE MAGNETIC FIELDS",
	"DAVID CROSS",
	"SEUN KUTI & EGYPT 80",
	"THE ANTLERS",
	"JUSTIN TOWNES EARLE",
	"BLACK MILK",
	"WILLIAM ELLIOTT WHITMORE",
	"SHARON VAN ETTEN",
	"TIM HECKER",
	"RHYS CHATHAM",
	"LESLIE & THE LY'S",
	"THE WAR ON DRUGS",
	"KIMYA DAWSON"
]

tier_two = [
	"DIRTY BEACHES",
	"BOWERBIRDS",
	"JON BENJAMIN",
	"JON GLASER",
	"MIKE DOUGHTY",
	"WILLIAM FITZSIMMONS",
	"OBERHOFER",
	"ERASE ERRATA",
	"LITTLE SCREAM",
	"LIKE PIONEERS",
	"RENE HELL",
	"CAROLINE SMITH & THE GOODNIGHT SLEEPS",
	"LULACRUZA",
	"THE DAREDEVIL CHRISTOPHER WRIGHT",
	"GOLDEN BIRDS",
	"THE POISON CONTROL CENTER",
	"GARDENS & VILLA",
	"EL TEN ELEVEN",
	"THE PARLOUR SUITE",
	"AMBER TAMBLYN",
	"MISSION BEAT DANCE PARTY",
	"THE WHEELERS"
]

tier_three = [
	"WET HAIR",
	"MUSCLE DRUM", 
	"DENISON WITMER", 
	"WEED WOLF",
	"GRAND TETONS", 
	"CHRISTOPHER THE CONQUERED",
	"MUMFORDS",
	"THE OLYMPICS", 
	"T'BONE",
	"THE LONELYHEARTS", 
	"ALEXIS STEVENS",
	"THE SAVAGE YOUNG TATERBUG", 
	"ION",
	"KELLY HOGAN", 
	"RICH ROK",
	"SUPER SONIC PISS", 
	"DOUG NYE",
	"DEATH SHIPS", 
	"NORTH ENGLISH", 
	"EMPERORS CLUB",
	"NATHAN WHEELER",
	"LADY ESPINA",
	"SLUT RIVER",
	"MARY LYNN RAJSKUB", 
	"BEAU SIA",
	"DERRICK BROWN", 
	"SLIP SILO",
	"SURGERY",
	"EX-ACTION MODEL", 
	"SUDDEN AND SUBTLE", 
	"TIRES",
	"BROOKS STRAUSE & THE GORY DETAILS",
	"BILLY HOWKE & THE HOAX",
	"MICHAELSARAH",
	"SOLID ATTITUDE",
	"CANDY BREAKS"
]

seed_images = Dir::entries("db/seed_images").reject{|i| i == "." || i == ".."}

tier_one.each do |artist|
	name = artist.downcase.split(" ").map(&:capitalize).join(" ")
	randomize = Random.new
	img = randomize.rand(0..seed_images.length-1)
	image = File.open("db/seed_images/#{seed_images[img]}")
	Artist.create(:name => name, :tier => 1, :official_url => "", :display_order =>"", :soundcloud_url=>"", :youtube_url=>"",:bio=>"", :image=>image)
end