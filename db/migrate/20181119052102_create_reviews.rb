class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.integer :rate
      t.string :body
      t.integer :shop_id

      t.timestamps
    end
  end
end
