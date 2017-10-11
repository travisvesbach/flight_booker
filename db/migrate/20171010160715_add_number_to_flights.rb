class AddNumberToFlights < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :number, :integer
  end
end
