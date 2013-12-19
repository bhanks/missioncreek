class AddLitFestToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :lit_fest, :boolean
  end
end
