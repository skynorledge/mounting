class Public::DeliveriesController < ApplicationController

  before_action :authenticate_customer!

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


  #def is_matching_login_customer
    #customer_id = params[:id].to_i
    #unless customer_id == current_customer.id
      #redirect_to new_customer_registration_path
    #end
  #end


end
