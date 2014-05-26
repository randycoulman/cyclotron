class AddNotesToRide < ActiveRecord::Migration
  def change
    add_column :rides, :notes, :text
  end
end
