class Public::ItemsController < ApplicationController


  def show

    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

  end



  def index

    @items = Item.all


  end

  private
  def item_params
      params.require(:item).permit(:genre_id, :name,:introduction,:price,:is_active)
  end


end
