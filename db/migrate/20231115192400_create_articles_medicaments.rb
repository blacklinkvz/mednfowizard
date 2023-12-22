class CreateArticlesMedicaments < ActiveRecord::Migration[7.1]
  def change
    create_table :articles_medicaments do |t|
      t.references :article, null: false, foreign_key: true
      t.references :medicament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
