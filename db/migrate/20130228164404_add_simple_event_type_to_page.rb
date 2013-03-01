class AddSimpleEventTypeToPage < ActiveRecord::Migration
  def change
  	add_column :pages, :simple_event_type, :string
  end
end
