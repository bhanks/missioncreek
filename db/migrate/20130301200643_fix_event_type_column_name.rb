class FixEventTypeColumnName < ActiveRecord::Migration
  def up
  	remove_column :simple_events, :type
  	remove_column :pages, :simple_event_type
  	add_column :simple_events, :category, :string
  	add_column :pages, :simple_event_category, :string
  end

  def down
  end
end
