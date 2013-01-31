class AddSpotifyPlaylistToArtist < ActiveRecord::Migration
  def change
  	add_column :artists, :spotify_url, :string
  end
end
