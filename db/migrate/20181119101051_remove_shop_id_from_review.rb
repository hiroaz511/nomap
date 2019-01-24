class RemoveShopIdFromReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :shop_id, :integer
  end
end
