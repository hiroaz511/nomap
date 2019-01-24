class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop = Shop.find(params[:id])
    @ave_review = Review.where(shop_id: @shop.id).average(:rate)
  end
  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(name: params[:shop][:name], station: params[:shop][:station], prefucture: params[:shop][:prefucture], city: params[:shop][:city], address: params[:shop][:address], url: params[:shop][:url], tell_num: params[:shop][:tell_num],shop_image: params[:shop][:shop_image], start_time: params[:shop][:start_time], end_time: params[:shop][:end_time], features: params[:shop][:features], holidays: params[:shop][:holidays], wifi: params[:shop][:wifi], sockets: params[:shop][:sockets], non_smorker: params[:shop][:non_smorker], smorker: params[:shop][:smorker], mid_night: params[:shop][:mid_night], close_from_station: params[:shop][:close_from_station], parking: params[:shop][:parking], co_working: params[:shop][:co_working], printer: params[:shop][:printer],)

    require 'date'
    time = Time.now

    if @shop.shop_image
       @shop.shop_image= "#{time}.jpg"
       image = params[:shop][:shop_image]
       File.binwrite("public/#{@shop.shop_image}",image.read)
    else
       puts "写真ないよ"
       @shop.shop_image= "no-image.png"
    end

    if @shop.wifi == "1"
       @shop.wifi = "#Wifi有り"
    else
       @shop.wifi = ""
    end

    if @shop.sockets == "1"
       @shop.sockets ="#電源有り"
    else
       @shop.sockets = ""
    end

    if @shop.non_smorker == "1"
       @shop.non_smorker = "#完全禁煙"
    else
       @shop.non_smorker = ""
    end

    if @shop.smorker == "1"
       @shop.smorker = "#喫煙可"
    else
       @shop.smorker =""
    end

    if @shop.mid_night == "1"
       @shop.mid_night = "#深夜営業"
    else
       @shop.mid_night = ""
    end

    if @shop.close_from_station == "1"
       @shop.close_from_station = "#駅チカ"
    else
       @shop.close_from_station = ""
    end
    if @shop.parking == "1"
       @shop.parking = "#駐車場有り"
    else
       @shop.parking = ""
    end

    if @shop.co_working == "1"
       @shop.co_working = "#コワーキングスペース"
    else
       @shop.co_working = ""
    end

    if @shop.printer == "1"
       @shop.printer = "#プリンター有り"
    else
       @shop.printer = ""
    end


    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: '店舗登録を完了しました' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: '店舗の更新をしました' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: '店舗の削除をしました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def shop_params
    #   params.require(:shop).permit(:name, :station, :prefucture, :city, :address, :url, :tell_num, :shop_image, :business_hours, :start_time, :end_time, :features, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :national_holiday)
    # end
end
