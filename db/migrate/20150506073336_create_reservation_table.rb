class CreateReservationTable < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
        t.integer 'user_id'
        t.timestamp 'start_time'
        t.timestamp 'end_time'
    end

    add_foreign_key :reservations, :users
  end
end
