class CreateRoles < ActiveRecord::Migration[5.2]
	def change
		create_table :roles do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :is_deleted, default: false
      t.timestamps
		end
	end
end
