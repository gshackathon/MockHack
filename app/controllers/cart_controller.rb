class CartController < ApplicationController
  def new
    @productid = params[:product] 
    respond_to do |format|
      format.js
    end
  end
end
