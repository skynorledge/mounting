class Public::CartItemsController < ApplicationController


  def create

    @customer = current_customer
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    @cart_item.save

    redirect_to public_cart_items_path

  end

  def index

    @items = Item.all

  end

  def update

  end

  def destroy

  end





  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount,:name)
  end

end
