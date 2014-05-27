class RenameRideDateToRodeOn < ActiveRecord::Migration
  def change
    rename_column :rides, :ride_date, :rode_on
  end
end
