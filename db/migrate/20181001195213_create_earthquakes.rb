class CreateEarthquakes < ActiveRecord::Migration[5.2]
  def change
    create_table :earthquakes do |t|
      t.string :title
      t.integer :year
      t.integer :day
      t.integer :month
      t.integer :hour
      t.integer :minute
      t.float :second
      t.float :latitude
      t.float :longitude
      t.float :magnitude
      t.text :description
      t.string :source
      t.string :logo
    end
  end
end
