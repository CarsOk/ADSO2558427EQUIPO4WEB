class Companies::UsersController < ApplicationController
    before_action :set_company
    
    def index
      authorize @company, :index?
      @users = @company.users
    end
  
    def new
      authorize @company, :new? 
      @user = @company.users.new
    end
    
    
    def edit
      @company = Company.find(params[:company_id])
      @user = @company.users.find(params[:id])
      @disabled = false
    end

    def create
      @user = @company.users.new(user_params)      
      if @user.save
        flash[:notice] = 'Usuario creado exitosamente.'
        redirect_to company_path(@company)
      else
          render :new
      end
    end
    def update
      @user = @company.users.find(params[:id])
    
      
      if user_params[:password].present? && user_params[:password_confirmation].present?
        if @user.update(user_params.except(:email))
          flash[:notice] = 'Usuario actualizado exitosamente.'
          render :edit, turbolinks: false
        else
          render :edit
        end
      else
        
        if @user.update_without_password(user_params.except(:email, :password, :password_confirmation))
          flash[:notice] = 'Usuario actualizado exitosamente.'
          render :edit, turbolinks: false
        else
          render :edit
        end
      end
    end
    
    def destroy
      @user = @company.users.find(params[:id])
      authorize @user, :destroy?
      if @user.destroy
        flash[:notice] = 'Usuario eliminado exitosamente.'
      else
        flash[:alert] = 'Error al intentar eliminar al usuario.'
      end
    
      redirect_to company_path(@company)
    end
    rescue_from Pundit::NotAuthorizedError, with: :user
  
    private
  
    def set_company
      @company = Company.find(params[:company_id])
    end
  
    def user_params
      params.require(:user).permit(:nombre, :apellido, :email, :password, :password_confirmation, :avatar)
    end
    
    def update_without_password(params)
      params.delete(:password)
      params.delete(:password_confirmation)
      update(params)
    end
    def user
      flash[:alert] = 'Acceso no autorizado.'
      redirect_to company_path(current_user.company_id)
    end
  
  end
  