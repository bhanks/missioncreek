class CreateSimpleEvents < ActiveRecord::Migration
  def change
    create_table :simple_events do |t|
      t.string :title
      t.date :date
      t.time :start
      t.boolean :free
      t.boolean :soldout
      t.text :description
      t.string :type
      t.string :image
      t.string :price
      t.string :ticket_url
      t.integer :venue_id

      t.timestamps
    end
  end
end
