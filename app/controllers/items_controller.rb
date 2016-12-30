class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @product = Product.find(params[:product_id])
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "#{@item.quantity} item(s) were added to basket"
      redirect_to products_path
    else
      flash[:notice] = @item.errors.full_messages
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :quantity)
  end

end
