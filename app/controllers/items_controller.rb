class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product, :class_id, :product_description, :product_states_id, :shipping_chargers_is, :region_id, :eta_id, :price, :image).merge(user_id: current_user.id)
  end
end