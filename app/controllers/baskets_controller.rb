class BasketsController < ApplicationController

  def show
    @items = current_user.items
    @subtotal = 0
  end
end
