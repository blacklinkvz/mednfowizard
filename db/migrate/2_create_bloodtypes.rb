class CreateBloodtypes < ActiveRecord::Migration[7.1]
  def change
    create_table :bloodtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
