class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @orders = Order.all
    unless current_user.admin
      @orders = Order.where(company_id: current_user.company_id)
    end
    @consecutivo = params[:consecutivo]
    @fecha_desde = params[:fecha_desde]
    @fecha_hasta = params[:fecha_hasta]
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
      format.pdf { render template: 'orders/reporte', pdf: 'Reporte' }
    end
  end

  def generar_pdf
    fecha_desde = params[:fecha_desde]
    fecha_hasta = params[:fecha_hasta]
    consecutivo = params[:consecutivo]
  
    @orders = Order.all
  
    if fecha_desde.present? && fecha_hasta.present?
      fecha_desde = Date.parse(fecha_desde)
      fecha_hasta = Date.parse(fecha_hasta)
      @orders = @orders.where(fecha: fecha_desde..fecha_hasta)
    end
  
    if consecutivo.present?
      @orders = @orders.where(consecutivo: consecutivo)
    end
  
    respond_to do |format|
      format.pdf { render template: 'orders/reporte', pdf: 'Reporte' }
    end
  end
  

  def export_to_excel
    @orders = Order.all
  
    if params[:fecha_desde].present? && params[:fecha_hasta].present?
      fecha_desde = Date.parse(params[:fecha_desde])
      fecha_hasta = Date.parse(params[:fecha_hasta])
      @orders = @orders.where(fecha: fecha_desde..fecha_hasta)
    end
  
    if params[:consecutivo].present?
      @orders = @orders.where(consecutivo: params[:consecutivo])
    end
  
    respond_to do |format|
      format.xlsx do
        template_path = File.join(Rails.root, 'lib', 'assets', 'plantilla.xlsx')
        excel = Axlsx::Package.new
        workbook = excel.workbook
  
        workbook.add_worksheet(name: 'Ordenes') do |sheet|
          sheet.add_row ['Fecha', 'Consecutivo', 'Origen', 'Destino', 'Descripción', 'Cantidad']
  
          @orders.each do |order|
            order.packs.each_with_index do |pack, index|
              if index == 0
                sheet.add_row [order.fecha, order.consecutivo, order.origen, order.destino, pack.tipo, pack.cantidad]
              else
                sheet.add_row ['', '', '', '', pack.tipo, pack.cantidad]
              end
            end
          end
        end
  
        tmpfile = Tempfile.new(['ordenes', '.xlsx'])
        excel.serialize(tmpfile.path)
  
        send_file tmpfile.path, filename: 'ordenes.xlsx', type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', disposition: 'attachment'
      end
    end
  end
  


  
  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    @packs = @order.packs
    @ruta = @order.dispatch
  end

  # GET /orders/new
  def new
    if current_user.admin?
      redirect_to orders_path, alert: "Los administradores no pueden crear órdenes."
    else
      @order = Order.new
      @order.packs.build
    end
  end

  # GET /orders/1/edit
  def edit
    if current_user.admin?
      @order = Order.find(params[:id])
      @order.packs.build
    else
      redirect_back(fallback_location: orders_path, alert: "No tienes permiso para editar órdenes.")
    end
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.user = current_user 
    @order.company_id = current_user.company_id

    respond_to do |format|
      if @order.save
        OrderMailer.new_order(@order).deliver_later
        format.html { redirect_to order_url(@order), notice: "La orden se ha creado satisfactoriamente." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, alert: "Error al crear la orden.", status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    @order = Order.find(params[:id])
    @user = @order.user
    respond_to do |format|
      if @order.update(order_params)
        if @order.saved_change_to_attribute?(:estado)
          OrderMailer.status(@order).deliver_later
        end
        format.html { redirect_to order_url(@order), notice: "El estado de la orden se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, alert: "Error al actualizar el estado de la orden.", status: :unprocessable_entity }
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
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:fecha, :consecutivo, :destino, :origen, :avatar, :estado, :valor, :dispatch_id, packs_attributes: Pack.attribute_names.map(&:to_sym).push(:_destroy))
    end
    def filtrar_ordenes
      @orders = Order.all
    
      if params[:fecha_desde].present? && params[:fecha_hasta].present?
        fecha_desde = Date.parse(params[:fecha_desde])
        fecha_hasta = Date.parse(params[:fecha_hasta])
        @orders = @orders.where(fecha: fecha_desde..fecha_hasta)
      end
    
      if params[:consecutivo].present?
        @orders = @orders.where(consecutivo: params[:consecutivo])
      end
    end
end