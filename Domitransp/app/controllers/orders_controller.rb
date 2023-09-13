class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
    if params[:fecha_desde].present? && params[:fecha_hasta].present?
      fecha_desde = Date.parse(params[:fecha_desde])
      fecha_hasta = Date.parse(params[:fecha_hasta])
      @orders = @orders.where(fecha: fecha_desde..fecha_hasta)
    end    
    if params[:consecutivo].present?
      @orders = Order.where(consecutivo: params[:consecutivo])
    end
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'orders/reporte', pdf: 'Reporte'}
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    @packs = @order.packs
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.packs.build
  end

  # GET /orders/1/edit
  def edit
    authorize @order
    @order = Order.find(params[:id])
    @order.packs.build
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:fecha, :consecutivo, :destino, :origen, :avatar, :estado, packs_attributes: Pack.attribute_names.map(&:to_sym).push(:_destroy))
    end
end