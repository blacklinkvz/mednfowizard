class AddNoteToArticlesDiseases < ActiveRecord::Migration[7.1]
  def change
    add_column :articles_diseases, :note, :string
  end
end
