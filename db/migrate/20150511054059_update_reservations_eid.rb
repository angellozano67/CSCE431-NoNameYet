class UpdateReservationsEid < ActiveRecord::Migration
  change_table 'reservations' do |t|
    t.string 'gcal_eventId'
  end
end
