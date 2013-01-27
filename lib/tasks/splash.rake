task :splash => :environment do
	if(File.exists?(Rails.public_path+"/inactive.html"))
		File.rename(Rails.public_path+"/inactive.html", Rails.public_path+"/index.html")
		puts "Splash page is now active."
	else
		File.rename(Rails.public_path+"/index.html", Rails.public_path+"/inactive.html")
		puts "Splash page no longer active."
	end
end