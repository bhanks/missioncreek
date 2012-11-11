class DashboardController < ApplicationController
	layout "dashboard.html.erb"
	before_filter :authenticate_user!


	def index
		@artists = Artist.find(:all, :order => "tier")
		@artists_fp = {}
		@artists_fp['displayed'] = Artist.where("front_page != ?", 0)
		@artists_fp['tier_one'] = Artist.where("tier = ? and front_page = ?", 1, 0)
		@artists_fp['tier_two'] = Artist.where("tier = ? and front_page = ?", 2, 0)
		@artists_fp['tier_three'] = Artist.where("tier = ? and front_page = ?", 3, 0)
		
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
