class ReviewsController < ApplicationController
  before_action :set_current_user
  # POST /reviews
  # POST /reviews.json
  def create
    @shop = Shop.find(params[:shop_id])
    @review = @shop.reviews.create(reviewer: params[:review][:reviewer], rate: params[:review][:rate], body: params[:review][:body])

    if @review.save
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      flash[:notice] = "レビューの投稿が完了しました"
      redirect_to shop_path(@shop)

    else
      redirect_to shop_path(@shop)
      flash[:notice] = "レビューの投稿に失敗しました"
    end


  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @shop = Shop.find(params[:shop_id])
    @review = @shop.reviews.find(params[:id])
    @review.destroy
    redirect_to shop_path(@shop)
  end

  # private
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def review_params
  #     params.require(:review).permit(:reviewer, :rate, :body, :shop_id)
  #   end
end
