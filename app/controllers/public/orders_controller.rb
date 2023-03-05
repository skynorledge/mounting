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
      @order.name = current_customer.first_name + current_customer.last_name

    elsif (params[:order][:select_address]) == "1"
      @address = Address.find(params[:order][:address_id])
      @order = Order.new(order_params)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif (params[:order][:select_address]) == "2"
      @order = Order.new(order_params)
      @order.save
      @order.customer_id = current_customer.id
      redirect_to orders_confirm_path

    else
      @order = Order.new(order_params)
      render :confirm

    end

    @cart_items = CartItem.all

    @order.shipping_cost = 800

  end

  def complete

  end


  def create

    @order = Order.new(order_params)

    @order.customer_id = current_customer.id

    @order.save

    redirect_to orders_complete_path

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

  #def is_matching_login_customer
    #customer_id = params[:id].to_i
    #unless customer_id == current_customer.id
      #redirect_to new_customer_registration_path
    #end
  #end


end
