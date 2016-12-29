class ItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @item = Item.new
  end
end
