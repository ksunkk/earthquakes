class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :is_deleted
      t.string :code, null: false
      t.timestamps
    end
  end
end
