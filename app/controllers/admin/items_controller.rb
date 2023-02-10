class Admin::ItemsController < ApplicationController

  def new

    @item = Item.new

  end

  def create

    @item = Item.new(item_params)

    @item.save

    redirect_to admin_item_path(@item)

  end

  def show

    @item = Item.find(params[:id])

  end

  def index

    @items = Item.all

  end

  def edit

    @item = Item.find(params[:id])

  end


  def update

    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save

    redirect_to admin_item_path(@item.id)
    else
      @items = Item.all
      render :edit
    end

  end


  private
    def item_params
      params.require(:item).permit(:image,:name,:introduction,:price,:genre_id,:is_active)
    end

end
