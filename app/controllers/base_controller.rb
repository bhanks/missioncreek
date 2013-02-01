class BaseController < ApplicationController

	def index
		@posts = Post.all
		@artists = Artist.where("front_page != ?", 0).order("front_page")
		# @feature_one = Page.where("title = ?", "Literature")
		# @feature_two = Page.where("title = ?", "Food")
		# @feature_three = Page.where("title = ?", "Artist Residency")
		@feature_one = Page.where("title = ?", "Parent").first
		@feature_two = Page.where("title = ?", "About").first
		@feature_three = Page.where("title = ?", "Parent").first

		render :layout => "application"
	end




end