class AddDisplayOrderToArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :display_order, :integer
  end
end
