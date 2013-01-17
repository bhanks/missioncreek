class DashboardController < ApplicationController
	layout "dashboard.html.erb"
	before_filter :authenticate_user!


	def index
		@artists = Artist.find(:all, :order => "tier")
		@artists_fp = {}
		@artists_fp['displayed'] = Artist.where("front_page != ?", 0).order('front_page')
		@artists_fp['undisplayed'] = Artist.where("front_page = ?", 0).order("tier, name")
		
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

	def pages
		@pages = Page.all
		@page_active = 'active'
	end

end
