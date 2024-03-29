class FinanzasController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders = Order.all.order(:fecha)
      if params[:company_id].present?
        @orders = Order.where(company_id: company_id)
      
        if params[:fecha].present?
          fecha = Date.parse(params[:fecha])
          @orders = @orders.where(fecha: fecha)
        end
      else 
        if params[:fecha].present?
          fecha = Date.parse(params[:fecha])
          @orders = @orders.where(fecha: fecha)
        end
      end
    else
      @orders = Order.where(company_id: current_user.company_id)
      if params[:consecutivo].present?
        @orders = @orders.where(consecutivo: params[:consecutivo])
      elsif params[:fecha].present?
        @orders = @orders.where(fecha: params[:fecha])
      end
    end
  end
end
