class Public::ItemsController < ApplicationController

  def show

    @items = Item.all
    @item = Item.find(params[:id])

  end



  def index

    @items = Item.all

  end













end
