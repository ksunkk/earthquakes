class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :conference_id
      t.string :user_name
      t.string :phone
      t.boolean :is_confirmed
      t.boolean :is_deleted
      t.timestamps
    end

    change_table :conferences do |t|
      t.boolean :needs_payment

    end
  end
end
