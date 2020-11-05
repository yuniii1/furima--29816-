class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def order_params
    params.repuire(:order_address).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :tell_phone, :purchase).merge(item_id: params[:item_id],user_id: current_user.id)
  end
end
