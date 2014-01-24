class AddVisibleFieldToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :visible, :boolean
    Artist.all.each do |artist| 
      artist.visible = true
      artist.save!
    end
  end
end
