class DispatchesController < ApplicationController
  before_action :set_dispatch, only: [:edit, :update]  

    def index
      @dispatches = Dispatch.all
      authorize @dispatches
    end

    def new
      @dispatch = Dispatch.new
      authorize @dispatch
    end
    
    def create
      @dispatch = Dispatch.new(dispatch_params)
      if @dispatch.save
        flash[:notice] = 'Ruta creada con éxito.'
        redirect_to dispatches_path
      else
        flash[:alert] = 'Error al crear la ruta.'
        render 'new'
      end
    end
    
  
    def edit
      @dispatch = Dispatch.find(params[:id])
    end

    def update_dispatches
      dispatch_params = params[:dispatches]
    
      if dispatch_params.present?
        dispatch_params.each do |dispatch_param|
          dispatch = Dispatch.find(dispatch_param[:id])
          switch_value = dispatch_param[:switch] == '1' ? true : false
          dispatch.update(switch: switch_value)
        end
    
        flash[:notice] = 'Rutas actualizadas exitosamente.'
      else
        flash[:alert] = 'No se actualizaron las rutas.'
      end
    
      redirect_to dispatches_path
    end
    
    
    
  
    def update
      @dispatch = Dispatch.find(params[:id])
      if @dispatch.update(dispatch_params)
        redirect_to dispatches_path, notice: 'Estado de ruta actualizado exitosamente.'
      else
        render :edit
      end
    end
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    private
  
    def set_dispatch
      @dispatch = Dispatch.find(params[:id])
      authorize @dispatch
    end
  
    def dispatch_params
      params.require(:dispatch).permit(:origen, :destino, :horario, :switch)
    end
    
    def user_not_authorized
      flash[:alert] = "No tienes permiso para acceder a esta página."
      redirect_to(request.referrer || root_path) 
    end
  end
  