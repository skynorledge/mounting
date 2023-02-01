class Public::CustomersController < ApplicationController
  
  def show
    
    @public = Public.find(params[:id])
    
  end


  def edit

    @public = Public.find(params[:id])

  end
  
  
  
  
  
  
  
end
