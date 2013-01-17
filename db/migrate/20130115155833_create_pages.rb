class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :nav_order
      t.integer :feature_order

      t.timestamps
    end
  end
end
