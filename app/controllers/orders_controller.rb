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
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else 
      render :index
    end
  end
  
  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :tell_phone, :purchase).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
