class CreatePdfArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :pdf_articles do |t|
      t.string :title
      t.integer :earthquake_id
    end
  end
end
