class ChangeArtistOrderColumn < ActiveRecord::Migration
  def up
    remove_column :artists, :order
    add_column :artists, :event_order, :integer
  end

  def down
  end
end
