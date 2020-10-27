class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_date_id, :shipping_id, :shipment_source_id, :user, :price, :image).merge(user_id: current_user.id)
  end
end
