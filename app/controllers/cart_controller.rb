class CartController < ApplicationController
  def new
    @productid = params[:product] 
    session[:product] ||= [] 
    session[:product].push(@productid)
    respond_to do |format|
      format.js
    end
  end

  def index
    @products = Product.find(session[:product])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end

  end
end
