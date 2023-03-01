class Public::OrdersController < ApplicationController

  def new

    @order = Order.new

  end

  def confirm

    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

  end

  def complete

  end


  def create

    @order = Order.new(order_params)

    @order.save

    redirect_to orders_confirm_path

  end

  def show

    @order = Order.find(params[:id])

  end

  def index

    @orders = Order.all

  end


  private
    def order_params
      params.require(:order).permit(:address_id,:customer_id,:postal_code,:address,:name,
      :shipping_cost,:total_payment,:payment_method,:status)
    end














end
