class AddQuantityToArticlesMedicaments < ActiveRecord::Migration[7.1]
  def change
    add_column :articles_medicaments, :quantity, :float
  end
end
