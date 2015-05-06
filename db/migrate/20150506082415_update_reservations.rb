class UpdateReservations < ActiveRecord::Migration
  def change
    change_table 'reservations' do |t|
        t.remove :start_time, :end_time
        t.string :start_time
        t.string :end_time
    end
  end
end
