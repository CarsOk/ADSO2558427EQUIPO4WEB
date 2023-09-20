class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :set_company, only: [:new, :create, :index]
    
    def index
        @company = Company.find(params[:company_id])
        # Verifica si el usuario actual pertenece a la empresa
        if current_user.company == @company
            # Carga solo los usuarios de la empresa actual
            @users = @company.users
        end
    end
    def new
        @user = @company.users.build
    end
    
    def create
        @user = @company.users.build(user_params)
        if @user.save  
        else
        render :new
        end
    end
    
    private
    
    def set_company
        @company = Company.find(params[:company_id])
    end
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :nombre, :apellido)
    end
end
