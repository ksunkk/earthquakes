class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.integer :confirmation_fails_count
    end
  end
end
