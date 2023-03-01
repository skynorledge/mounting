class Public::DeliveriesController < ApplicationController



  def create

    @delivery = Address.new(address_params)

    @delivery.save

    redirect_to public_delivery_path

  end

  def edit

    @delivery = current_customer

  end

  def index

    @deliveries = Address.all

  end

  def update

    @delivery = current_customer
    @delivery.update(address_params)
    @delivery.save

    redirect_to public_deliveries_path

  end


  private
    def address_params
      params.require(:address).permit(:postal_code,:address,:name,:customer_id)
    end








end
