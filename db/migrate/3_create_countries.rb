class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha3_code
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
