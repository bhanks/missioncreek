class BaseController < ApplicationController

	def index
		@posts = Post.all
		@artists = Artist.where("front_page != ?", 0).order("front_page")
		@features = Page.where("feature_order IS NOT NULL").order("feature_order")
		
		render :layout => "application"
	end




end