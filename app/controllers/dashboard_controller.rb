class DashboardController < ApplicationController
	layout "dashboard.html.erb"

	def artists
		@artists = Artist.all
		render 'artists/index'
	end

end
