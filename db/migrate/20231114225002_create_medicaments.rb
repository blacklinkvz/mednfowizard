class CreateMedicaments < ActiveRecord::Migration[7.1]
  def change
    create_table :medicaments do |t|
      t.string :name
      t.string :compound
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
