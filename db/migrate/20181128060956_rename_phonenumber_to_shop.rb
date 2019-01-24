class RenamePhonenumberToShop < ActiveRecord::Migration[5.2]
  def change
  	change_column :shops, :tell_num, :string
  end
end
