module Companies
    class UsersController < ApplicationController
    before_action :set_company
    
    def index
        if current_user.company == @company
            # Carga solo los usuarios de la empresa actual
            @users = @company.users
        end
    end
    def new
        @user = @company.users.new
    end
    
    def create 
        
    end
    private
    
    def set_company
        @company = Company.find(params[:company_id])
    end    
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :nombre, :apellido)
    end
end
