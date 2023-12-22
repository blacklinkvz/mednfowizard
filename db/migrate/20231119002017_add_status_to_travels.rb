class AddStatusToTravels < ActiveRecord::Migration[7.1]
  def change
    add_column :travels, :status, :string
  end
end
