class AddKeyToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :key, :string
  end
end
