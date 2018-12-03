class NotificationMethods < ActiveRecord::Migration[5.2]
  METHODS = { email: 'e-mail',
              phone: 'Телефон',
              messengers: 'Мессенджеры' }.each_value(&:freeze).freeze
  def up
    create_table :notification_methods do |t|
      t.string :code
      t.string :name
      t.boolean :is_deleted, default: false
      t.timestamps
    end
    METHODS.each do |k, v|
      execute <<-SQL.squish!
        INSERT INTO notification_methods (code, name, created_at, updated_at)
        VALUES ('#{k}', '#{v}', now(), now())
      SQL
    end
  end

  def down
    drop_table :notification_methods
  end
end
