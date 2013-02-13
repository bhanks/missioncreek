class DisplayTitleForEvent < ActiveRecord::Migration
  def up
  	add_column :events, :show_title, :boolean
  end

  def down
  end
end
