class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
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
    params.permit(:item_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :tell_phone, :purchase).merge(user_id: current_user.id)
  end

end
