class BaseController < ApplicationController

	def index
		@posts = Post.all
		@artists = Artist.all
		render :layout => "application"
	end

end