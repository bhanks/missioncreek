class AssociateArtistsWithEvents < ActiveRecord::Migration
  def up
  	add_column :artists, :event_id, :integer
  	add_column :artists, :headliner, :boolean
  end

  def down
  end
end
