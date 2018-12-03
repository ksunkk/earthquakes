class CreateNotificationMethodUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :notification_method_users do |t|
      t.integer :user_id
      t.integer :notification_method_id
    end
  end
end
