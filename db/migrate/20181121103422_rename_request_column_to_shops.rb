class RenameRequestColumnToShops < ActiveRecord::Migration[5.2]
  def change
  	change_column :shops, :monday, :string
    change_column :shops, :tuesday, :srring
    change_column :shops, :wednesday, :srring
    change_column :shops, :thursday, :srring
    change_column :shops, :friday, :srring
    change_column :shops, :saturday, :srring
    change_column :shops, :sunday, :srring
    change_column :shops, :national_holiday, :srring
  end
end
