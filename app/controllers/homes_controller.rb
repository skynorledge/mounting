class HomesController < ApplicationController
  def top

    @items = Item.all

    #@customer = Customer.find(params[:id])


  end

  def about
  end

  def thanks
  end

end
