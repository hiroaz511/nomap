class AddStartTimeToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :start_time, :integer
    add_column :shops, :end_time, :integer
    remove_column :shops, :business_hours, :integer
  end
end
