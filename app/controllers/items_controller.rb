class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
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
    params.require(:item).permit(:product, :class_id, :product_description, :product_states_id, :shipping_chargers_id, :region_id, :eta_id, :price, :image).merge(user_id: current_user.id)
  end
end