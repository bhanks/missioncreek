class AddFrontPageToArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :front_page, :boolean, :default => false
  end
end
