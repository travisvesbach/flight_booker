class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.references :from_airport
      t.references :to_airport
      t.datetime :departure
      t.integer :duration

      t.timestamps
    end
  end
end
