class AddLocationToAirports < ActiveRecord::Migration[5.1]
  def change
    add_column :airports, :location, :string
  end
end
