class AddFeaturesToShop < ActiveRecord::Migration[5.2]
  def change
  	add_column :shops, :wifi, :string
    add_column :shops, :sockets, :string
    add_column :shops, :non_smorker, :string
    add_column :shops, :smorker, :string
    add_column :shops, :mid_night, :string
    add_column :shops, :close_from_station, :string
    add_column :shops, :parking, :string
    add_column :shops, :co_working, :string
    add_column :shops, :printer, :string
  end
end
