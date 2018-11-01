class ChangePhotosAndPdfs < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :file_id, :string
    add_column :pdf_articles, :file_id, :string
    add_column :pdf_articles, :article_id, :string
  end
end
