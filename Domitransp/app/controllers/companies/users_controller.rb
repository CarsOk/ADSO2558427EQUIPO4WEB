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
  
    def create
      @user = @company.users.new(user_params)      
      if @user.save
        flash[:notice] = 'Usuario creado exitosamente.'
        redirect_to company_path
      else
          render :new
      end
    end
    def destroy
      @user = @company.users.find(params[:id])
      authorize @user, :destroy?  # Asegúrate de tener una política para la acción destroy en tu modelo User
      @user.destroy
      flash[:notice] = 'Usuario eliminado exitosamente.'
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
  
    def user
      flash[:alert] = 'Acceso no autorizado.'
      redirect_to company_path(current_user.company_id)
    end
  
  end
  