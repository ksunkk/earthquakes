class AddNewFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :surname
      t.string  :work_place
      t.json    :keywords
      t.integer :role_id, default: 2
      t.string  :phone_number
      t.boolean :phone_confirmed, default: false
      t.boolean :email_confirmed, default: false
    end
  end
end
