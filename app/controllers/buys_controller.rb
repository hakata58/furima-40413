class BuysController < ApplicationController
  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
   
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
      
      
    end
  end




  private

  def buy_params
    
    params.require(:buy_address).permit(:post_code, :prefectures_id, :municipaloties, :street_address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
    # params.require(:buy_address).permit(:post_code, :prefecture_id , :municipaloties , :street_address , :building_name , :telephone ).merge(:user_id current_user.id, :item_id params[:item_id])
  end


end
