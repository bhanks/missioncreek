class DashboardController < ApplicationController
	layout "dashboard.html.erb"
	before_filter :authenticate_user!

	def artists
		@artists = Artist.all
		#render 'artists/admin_index'
	end

	def venues
		@venues = Venue.all
		#render 'venues/index'
	end

	def posts
		@posts = Post.all
	end

end
