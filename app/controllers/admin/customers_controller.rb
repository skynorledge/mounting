class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

   def confirm

    @customer = current_customer

   end

  def withdrawal

    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path

  end

  def show

    @customer = Customer.find(params[:id])

    #@customers = current_customer

  end


  def edit

    @customer = Customer.find(params[:id])

    #@customers = current_customer


  end

  def index

    @customers = Customer.all

    @orders = Order.all


  end

  def update

    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    @customer.save

    redirect_to admin_customer_path

  end


  private
    def customer_params
      params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,
      :email,:encrypted_password,:postal_code,:address,:telephone_number)
    end




end
