class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :station
      t.string :prefucture
      t.string :city
      t.string :address
      t.string :url
      t.integer :tell_num
      t.string :shop_image
      t.integer :business_hours
      t.integer :holidays
      t.integer :features

      t.timestamps
    end
  end
end
