class ChangeArtistsFrontPageToInteger < ActiveRecord::Migration
	def change
		remove_column :artists, :front_page
		add_column :artists, :front_page, :integer
	end
end
