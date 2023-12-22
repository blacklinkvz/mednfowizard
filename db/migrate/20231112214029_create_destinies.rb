class CreateDestinies < ActiveRecord::Migration[7.1]
  def change
    create_table :destinies do |t|
      t.date :start_date
      t.date :fishis_date
      t.references :country, null: false, foreign_key: true
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
