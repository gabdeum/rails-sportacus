class AddStripeAttributesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :state, :string
    add_monetize :bookings, :amount
    add_column :bookings, :checkout_session_id, :string
  end
end
