class CreateArticlesDiseases < ActiveRecord::Migration[7.1]
  def change
    create_table :articles_diseases do |t|
      t.references :article, null: false, foreign_key: true
      t.references :disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
