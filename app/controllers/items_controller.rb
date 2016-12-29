class ItemsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    flash[:notice] = "#{item.quantity} item(s) were added to basket"
    redirect_to products_path
  end

  protected

  def item_params
    params.require(:item).permit(:name, :price, :quantity)
  end

end
