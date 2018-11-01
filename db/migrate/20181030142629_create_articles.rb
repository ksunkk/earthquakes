class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :file_link
      t.string :author
      t.string :source_link
      t.string :rating
      t.timestamps
    end
  end
end
