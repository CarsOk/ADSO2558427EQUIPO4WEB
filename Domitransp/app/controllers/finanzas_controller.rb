class FinanzasController < ApplicationController
  def index
    @orders = Order.all.order(:fecha)  
  end
end
