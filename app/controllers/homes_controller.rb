class HomesController < ApplicationController
  def top

    @items = Item.all

    #@public = Public.find(params[:id])


  end

  def about
  end
end
