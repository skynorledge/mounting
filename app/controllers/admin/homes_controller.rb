class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top

    @orders = Order.all

    @customer = current_customer

    @cart_items = CartItem.all


  end

end
