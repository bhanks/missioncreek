class AddReservationsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reservations, :boolean
    add_column :events, :reservation_url, :string
  end
end
