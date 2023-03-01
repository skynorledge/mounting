class Public::DeliveriesController < ApplicationController

  #before_action :is_matching_login_user, only: [:edit]

  def create

    @delivery = Address.new(address_params)

    @delivery.customer_id = current_customer.id

    @delivery.save

    redirect_to public_deliveries_path

  end

  def edit

    @delivery = Address.find(params[:id])

  end

  def index

    @deliveries = Address.all
    @delivery = Address.new

  end

  def update

    @delivery = Address.find(params[:id])
    @delivery.update(address_params)

    @delivery.save

    redirect_to public_deliveries_path

  end


  def destroy
    delivery = Address.find(params[:id])
    delivery.destroy
    redirect_to public_deliveries_path
  end


  private
    def address_params
      params.require(:address).permit(:postal_code,:address,:name,:customer_id)
    end


  #def is_matching_login_user
    #delivery = Address.find(params[:id])
    #login_cutomer_id = current_customer.id
    #if(delivery.customer.id != login_customer_id)
      #redirect_to public_deliveries_path
    #end
  #end


end
