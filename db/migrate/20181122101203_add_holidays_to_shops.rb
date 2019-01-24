class AddHolidaysToShops < ActiveRecord::Migration[5.2]
  def change
  	add_column :shops, :holidays, :string
  	remove_column :shops, :monday, :string
    remove_column :shops, :tuesday, :string
    remove_column :shops, :wednesday, :string
    remove_column :shops, :thursday, :string
    remove_column :shops, :friday, :string
    remove_column :shops, :saturday, :string
    remove_column :shops, :sunday, :string
    remove_column :shops, :national_holiday, :string
  end
end
