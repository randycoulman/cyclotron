class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :bike, index: true
      t.references :route, index: true
      t.date :ride_date
      t.decimal :distance, precision: 6, scale: 3
      t.decimal :speed, precision: 3, scale: 1

      t.timestamps
    end
  end
end
