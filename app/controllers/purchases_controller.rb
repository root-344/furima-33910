class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def purchase_address_params
    params.require(:purchase_address).permit(:zip, :ship_region_id, :ship_city, :ship_address, :ship_building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
