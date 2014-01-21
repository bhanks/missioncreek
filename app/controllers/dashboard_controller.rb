class DashboardController < ApplicationController
	layout "dashboard.html.erb"
	before_filter :authenticate_user!


	def index
		@artists = Artist.find(:all, :order => "tier")
		@artists_fp = {}
		@artists_fp['displayed'] = Artist.where("front_page != ?", 0).order('front_page')
		@artists_fp['undisplayed'] = Artist.where("front_page = ?", 0).order("tier, name")
		
		@tier1 = Artist.where(:tier => 1).order("display_order")
		@tier2 = Artist.where(:tier => 2).order("display_order")


		@venues = Venue.all
		@posts = Post.all
	end

	def artists
		@artists = Artist.order(:display_order)
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

	def events
		@events = Event.find(:all, :order => "date, start_time DESC")
		@events_active = "active"
	end

	def simple_events
		@simple_events = SimpleEvent.order("date, start DESC")
		@simple_events_active = "active"
	end

end
