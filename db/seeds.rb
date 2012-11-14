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

bios = [
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer urna risus, tristique sit amet vehicula in, tristique ac ante. Praesent id est arcu. Sed egestas fermentum nibh, posuere molestie lorem porta eget. Sed dignissim, nisi eget placerat scelerisque, ante ipsum pharetra enim, quis varius metus dui id velit. Nunc dapibus augue eu eros rhoncus at tempus nunc luctus. Nullam suscipit sodales leo sed ultrices. Maecenas mattis quam vitae est aliquet laoreet. Proin varius feugiat ligula eu ultrices. Etiam eu orci sed massa malesuada tristique. Vestibulum pulvinar dictum ante, sed aliquet diam pharetra nec. Fusce nec sollicitudin enim. Nullam nec congue ante. Proin in justo et mi pharetra interdum.",
"Nulla consectetur sodales ipsum id faucibus. Curabitur tempor consequat faucibus. Sed eu purus vel massa porta luctus eget eu leo. Phasellus quam erat, elementum a volutpat id, suscipit eget urna. Fusce in nunc in ligula laoreet vestibulum nec ac nibh. Sed libero justo, eleifend in faucibus ut, iaculis ut neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
"Nam nec neque ante, sit amet sollicitudin diam. Vivamus vel nunc nisl, non lacinia ligula. Mauris vehicula, lorem eget tempor tempor, urna nisi vestibulum orci, commodo lacinia est nisi at magna. Phasellus a enim vitae ante varius vehicula. Quisque nibh turpis, pulvinar et feugiat non, rutrum id dui. Aliquam egestas dolor turpis, dictum pretium justo. Duis porttitor lobortis magna.",
"Nullam a condimentum mi. Morbi et aliquam velit. Duis convallis rhoncus lacus eget hendrerit. Suspendisse imperdiet elementum tortor, a ultricies libero sodales at. Nulla nec lorem sed elit placerat fermentum. Curabitur pulvinar odio eu lacus pellentesque ac vestibulum purus vehicula. Phasellus libero lacus, blandit quis tempor id, molestie sit amet nulla. Cras dictum, lectus eget blandit dapibus, mauris metus imperdiet turpis, a vulputate risus lacus quis ipsum. Quisque cursus quam at mauris ornare eget rhoncus risus vestibulum.",
"Nulla facilisi. Nullam consequat fringilla justo vitae pellentesque. Donec mattis vehicula tincidunt. Sed eget felis lobortis elit laoreet vulputate. Duis aliquet placerat ipsum sed euismod. Morbi tincidunt cursus dui, at posuere lectus faucibus eu. Integer molestie tortor nec massa imperdiet ac accumsan arcu dignissim."
]

soundcloud = [
	'<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F66896659&show_artwork=true"></iframe>',
	'<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F66549792&show_artwork=true"></iframe>',
	'<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F66622510&show_artwork=true"></iframe>',
	'<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F59602587&show_artwork=true"></iframe>'
]

official = [
	"http://sunblind.net",
	"http://houseoftomorrow.com/",
	"http://blackmilk.biz/",
	"http://www.subpop.com/artists/david_cross"
]

youtube = [
	'<iframe width="420" height="315" src="http://www.youtube.com/embed/B2QqrvSryQA" frameborder="0" allowfullscreen></iframe>',
	'<iframe width="560" height="315" src="http://www.youtube.com/embed/Ri5PpkukPQI" frameborder="0" allowfullscreen></iframe>',
	'<iframe width="420" height="315" src="http://www.youtube.com/embed/jkjXr9SrzQE" frameborder="0" allowfullscreen></iframe>',
	'<iframe width="560" height="315" src="http://www.youtube.com/embed/cDHUtZ4WoE4" frameborder="0" allowfullscreen></iframe>'

]


seed_images = Dir::entries("db/seed_images").reject{|i| i == "." || i == ".."}
counter = 1
tier_one.each do |artist|
	name = artist.downcase.split(" ").map(&:capitalize).join(" ")
	randomize = Random.new
	img = randomize.rand(0..seed_images.length-1)
	bio = bios[randomize.rand(0..bios.length-1)]
	soundcloud_url = soundcloud[randomize.rand(0..soundcloud.length-1)]
	official_url = official[randomize.rand(0..official.length-1)]
	youtube_url = youtube[randomize.rand(0..youtube.length-1)]
	image = File.open("db/seed_images/#{seed_images[img]}")
	Artist.create(:name => name, 
		:tier => 1, 
		:official_url => official_url, 
		:display_order =>counter, 
		:soundcloud_url=>soundcloud_url, 
		:youtube_url=>youtube_url,
		:bio=>bio, 
		:image=>image)
	counter +=1
end

counter = 1
tier_two.each do |artist|
	name = artist.downcase.split(" ").map(&:capitalize).join(" ")
	randomize = Random.new
	img = randomize.rand(0..seed_images.length-1)
	bio = bios[randomize.rand(0..bios.length-1)]
	soundcloud_url = soundcloud[randomize.rand(0..soundcloud.length-1)]
	official_url = official[randomize.rand(0..official.length-1)]
	youtube_url = youtube[randomize.rand(0..youtube.length-1)]
	image = File.open("db/seed_images/#{seed_images[img]}")
	Artist.create(:name => name, 
		:tier => 2, 
		:official_url => official_url, 
		:display_order =>counter, 
		:soundcloud_url=>soundcloud_url, 
		:youtube_url=>youtube_url,
		:bio=>bio, 
		:image=>image)
	counter +=1
end
counter = 1
tier_three.each do |artist|
	name = artist.downcase.split(" ").map(&:capitalize).join(" ")
	randomize = Random.new
	img = randomize.rand(0..seed_images.length-1)
	bio = bios[randomize.rand(0..bios.length-1)]
	soundcloud_url = soundcloud[randomize.rand(0..soundcloud.length-1)]
	official_url = official[randomize.rand(0..official.length-1)]
	youtube_url = youtube[randomize.rand(0..youtube.length-1)]
	image = File.open("db/seed_images/#{seed_images[img]}")
	Artist.create(:name => name, 
		:tier => 3, 
		:official_url => official_url, 
		:display_order =>counter, 
		:soundcloud_url=>soundcloud_url, 
		:youtube_url=>youtube_url,
		:bio=>bio, 
		:image=>image)
	counter +=1
end







