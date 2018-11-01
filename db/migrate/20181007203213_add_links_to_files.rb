class AddLinksToFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :link, :string
    add_column :pdf_articles, :link, :string
  end
end
