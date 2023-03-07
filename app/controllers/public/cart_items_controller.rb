class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create

    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @new_amount = @cart_item.amount + params[:cart_item][:amount].to_i
      @cart_item.update(amount: @new_amount)
      redirect_to cart_items_path
    else
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    @cart_item.save

    redirect_to cart_items_path

    end

  end

  def index

    @cart_items = CartItem.all
    @customer = current_customer
    @numbers = [1,2,3,4,5,6,7,8,9,10]


  end

  def update

    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)

    redirect_to cart_items_path

  end

  def destroy

    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path

  end

  def destroy_all

    current_customer.cart_items.destroy_all
    redirect_to cart_items_path

  end





  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end


  #def is_matching_login_customer
    #customer_id = params[:id].to_i
    #unless customer_id == current_customer.id
      #redirect_to new_customer_registration_path
    #end
  #end

end
