class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new,:edit]
  before_action :set_furima ,only: [:show, :edit, :update,:destroy]



  def index
    @items=Item.all.order("created_at DESC")
    
  end

  def new
    
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    
    
  end

  def edit
   if current_user != @item.user || @item.buy.present?
    redirect_to root_path
   end 
    # redirect_to root_path unless current_user == @item.user || @item.buy.blank?
    
  end

  def update
    
    if @item.update(item_params)
    redirect_to item_path(params[:id])
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user && user_signed_in?
    @item.destroy
    redirect_to root_path
    else
      redirect_to root_path
    end
  end



  private

  def item_params
    params.require(:item).permit(:image,:items_name,:explanation,:category_id,:situation_id,:delivery_id,:prefectures_id,:day_id,:price).merge(user_id: current_user.id)
  end

  def set_furima
    @item = Item.find(params[:id])
  end

end
