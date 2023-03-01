class Public::OrdersController < ApplicationController
  
  def new

    @order = Order.new

  end

  def confirm

  end

  def complete

  end


  def create

    @order = Order.new(order_params)

    @order.save

    redirect_to admin_item_path(@item)

  end

  def show

    @order = Order.find(params[:id])

  end

  def index

    @orders = Order.all

  end


  private
    def order_params
      params.require(:order).permit(:customer_id,:postal_code,:address,:name,
      :shipping_cost,:total_payment,:payment_method,:status)
    end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end
