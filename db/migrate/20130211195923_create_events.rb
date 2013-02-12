class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :venue_id
      t.string :title
      t.date :date
      t.time :door_time
      t.time :start_time
      t.boolean :free
      t.boolean :soldout
      t.integer :price_advance
      t.integer :price_dayof
      t.string :ticket_url
      t.text :description

      t.timestamps
    end
  end
end
