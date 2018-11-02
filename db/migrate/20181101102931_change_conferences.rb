class ChangeConferences < ActiveRecord::Migration[5.2]
  def change
    add_column :conferences, :poster_id, :string
    add_column :conferences, :logo_id, :string
    add_column :conferences, :is_confirmed, :boolean
  end
end
