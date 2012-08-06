class DashboardController < ApplicationController
	layout "dashboard.html.erb"
	before_filter :authenticate_user!


	def index
		@artists = Artist.all
		@venues = Venue.all
		@posts = Post.all
	end

	def artists
		@artists = Artist.find(:all, :order => "tier, name")
		@artist_active = "active"
		#render 'artists/admin_index'
	end

	def venues
		@venues = Venue.find(:all, :order => "name")
		@venue_active = "active"
		#render 'venues/index'
	end

	def posts
		@posts = Post.find(:all, :order =>"created_at DESC")
		@post_active = "active"
	end

end
