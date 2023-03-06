class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new

    @order = Order.new

  end

  def confirm

    if (params[:order][:select_address]) == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif (params[:order][:select_address]) == "1"
      @address = Address.find(params[:order][:address_id])
      @order = Order.new(order_params)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif (params[:order][:select_address]) == "2"
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id

    else
      @order = Order.new(order_params)
      render :new

    end

    @cart_items = CartItem.all

    @order.shipping_cost = 800

  end

  def complete

  end


  def create

    @order = Order.new(order_params)

    @order.customer_id = current_customer.id

    @order.status = 0

    @order.save

    current_customer.cart_items.each do |order|

      order_item = OrderItem.new()

      order_item.order_id = @order.id

      order_item.item_id = order.item.id

      order_item.price = order.item.price

      order_item.quantity = order.amount

      order_item.making_status = 0

      order_item.save

    end

    current_customer.cart_items.destroy_all

    redirect_to orders_complete_path

  end

  def show

    @order = Order.find(params[:id])

    @customer = current_customer

    @cart_items = CartItem.all

    @orders = Order.all

    #current_customer.cart_items.each do |order|

      #order_item = OrderItem.new()

      #order_item.order_id = @order.id

      #order_item.item_id = order.item.id

      #order_item.price = order.item.price

      #order_item.quantity = order.amount

      #order_item.save

    #end

  end

  def index

    @orders = Order.all

    @customer = current_customer

    @cart_items = CartItem.all

  end


  private
    def order_params
      params.require(:order).permit(:customer_id,:postal_code,:address,:name,
      :shipping_cost,:total_payment,:payment_method)
    end


end
