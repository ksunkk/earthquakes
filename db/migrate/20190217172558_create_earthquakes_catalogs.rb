class CreateEarthquakesCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :earthquakes_catalogs do |t|
      t.references :earthquake
      t.references :catalog
    end
  end
end
