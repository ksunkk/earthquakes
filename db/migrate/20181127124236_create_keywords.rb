class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.boolean :is_deleted, default: true
    end
  end
end
