class CreateCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaries do |t|
      t.integer :user_id
      t.references :commentable, polymorphic: true
      t.text :text
      t.boolean :is_deleted, default: false
      t.boolean :is_accepted, default: false
      t.timestamps
    end
  end
end
