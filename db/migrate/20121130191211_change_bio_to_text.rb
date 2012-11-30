class ChangeBioToText < ActiveRecord::Migration
  def up
  		remove_column :artists, :bio
		add_column :artists, :bio, :text
  end

  def down
  end
end
