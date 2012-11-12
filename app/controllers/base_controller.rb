class BaseController < ApplicationController

	def index
		@posts = Post.all
		@artists = Artist.where("front_page != ?", 0).order("front_page")
		render :layout => "application"
	end



end