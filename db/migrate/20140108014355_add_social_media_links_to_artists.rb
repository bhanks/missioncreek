class AddSocialMediaLinksToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :facebook_url, :string
    add_column :artists, :twitter_url, :string
  end
end
