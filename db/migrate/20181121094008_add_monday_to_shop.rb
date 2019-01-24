class AddMondayToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :monday, :integer
    add_column :shops, :tuesday, :integer
    add_column :shops, :wednesday, :integer
    add_column :shops, :thursday, :integer
    add_column :shops, :friday, :integer
    add_column :shops, :saturday, :integer
    add_column :shops, :sunday, :integer
    add_column :shops, :national_holiday, :integer
    remove_column :shops, :holidays, :integer
  end
end
