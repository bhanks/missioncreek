class AddFieldsToArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :tier, :integer
  	add_column :artists, :order, :integer
  	rename_column :artists, :url, :official_url
  	add_column :artists, :soundcloud_url, :string
  	add_column :artists, :youtube_url, :string
  	add_column :artists, :bio, :string
  end
end
