class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show

    @orders = Order.all

    @order = Order.find(params[:id])

    @customer = @order.customer

    @orderitem = @order.order_items

    @cart_items = CartItem.all


  end

  private
    def order_params
      params.require(:order).permit(:customer_id,:postal_code,:address,:name,
      :shipping_cost,:total_payment,:payment_method)
    end


end
