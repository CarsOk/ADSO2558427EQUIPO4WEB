class Companies::UsersController < ApplicationController
    before_action :set_company
    def index
        @users = @company.users
    end 
    def new
        @user = @company.users.new
    end
    def create
        @user = @company.users.new(user_params)      
        if @user.save
            redirect_to company_users_path, notice: 'Usuario creado exitosamente.'
        else
            render :new
        end
    end

    private

    def set_company
        @company = Company.find(params[:company_id])
    end
    def user_params
        params.require(:user).permit(:nombre, :apellido, :email, :password, :password_confirmation, :avatar)
    end
end

