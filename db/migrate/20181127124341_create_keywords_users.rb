class CreateKeywordsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords_users do |t|
      t.references :keyword, index: true
      t.references :user, index: true
    end
  end
end
