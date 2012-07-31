class DashboardController < ApplicationController
	layout "dashboard.html.erb"
	before_filter :authenticate_user!


	def index
		@artists = Artist.all
		@venues = Venue.all
		@posts = Post.all
	end

	def artists
		@artists = Artist.all
		@artist_active = "active"
		#render 'artists/admin_index'
	end

	def venues
		@venues = Venue.all
		@venue_active = "active"
		#render 'venues/index'
	end

	def posts
		@posts = Post.all
		@post_active = "active"
	end

end
