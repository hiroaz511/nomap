class RemoveImageFromShop < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :image, :string
  end
end
