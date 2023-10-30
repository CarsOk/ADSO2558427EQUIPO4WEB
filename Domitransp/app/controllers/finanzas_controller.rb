class FinanzasController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders = Order.all.order(:fecha)
      if params[:fecha_desde].present?
        fecha_desde = Date.parse(params[:fecha_desde])
        @orders = @orders.where(fecha: fecha_desde.beginning_of_day..fecha_desde.end_of_day)
      end
      if params[:empresa].present?
        @orders = @orders.joins(:company).where('companies.razon_social LIKE ?', "%#{params[:empresa]}%")
      end
    else
      @orders = Order.where(company_id: current_user.company_id)
      @orders = @orders.where(consecutivo: params[:consecutivo]) if params[:consecutivo].present?
      @orders = @orders.where(fecha: params[:fecha]) if params[:fecha].present?
      @orders = filtro(@orders)
    end
  end

  private

  def filtro(query)
    if params[:fecha_desde].present? && params[:fecha_hasta].present?
      fecha_desde = Date.parse(params[:fecha_desde])
      fecha_hasta = Date.parse(params[:fecha_hasta])
      query = query.where(fecha: fecha_desde..fecha_hasta)
    end
    query
  end
end
