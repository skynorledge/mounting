class Public::CustomersController < ApplicationController

  def show

    @public = Public.find(params[:id])

  end


  def edit

    @public = Public.find(params[:id])

  end

  def index

    @items = Item.all

  end


  private
    def public_params
      params.require(:public).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,
      :email,:encrypted_password,:postal_code,:address,:telephone_number)
    end




end
