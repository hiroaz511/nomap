class FavoritesController < ApplicationController
 before_action :read_shop

  def create
 	if Favorite.find_by(user_id: @current_user.id, shop_id: params[:shop_id])
 	  @favorite = Favorite.find_by(user_id: @current_user.id, shop_id: params[:shop_id])
 	  @favorite.destroy
 	else
	  @favorite=Favorite.new(user_id: @current_user.id, shop_id: params[:shop_id])
	  @favorite.save
    end
  end

  def read_shop
    @shop = Shop.find_by(id: params[:shop_id])
  end

end