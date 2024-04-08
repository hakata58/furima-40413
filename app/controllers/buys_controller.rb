class BuysController < ApplicationController
  before_action :set_params 
  
  
  def index
    
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_address = BuyAddress.new
    
   
  end

  def create
    
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
      
      
    end
  end




  private

  def buy_params
    
    params.require(:buy_address).permit(:post_code, :prefectures_id, :municipaloties, :street_address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    # params.require(:buy_address).permit(:post_code, :prefecture_id , :municipaloties , :street_address , :building_name , :telephone ).merge(:user_id current_user.id, :item_id params[:item_id])
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: buy_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end



end
