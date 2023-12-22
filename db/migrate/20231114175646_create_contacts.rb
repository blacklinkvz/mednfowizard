class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.integer :phone
      t.references :user, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
