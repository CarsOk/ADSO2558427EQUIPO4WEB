class CompaniesController < ApplicationController
    before_action :authenticate_user!
    before_action :user, only: [:index]

    def index
        if params[:q]
            @companies = Company.where("lower(razon_social) like ?", "%#{params[:q].downcase}%")
        else
            @companies = Company.all
        end
    end
    
    
    
    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new(company_params)
        if @company.save
            flash[:notice] = 'Compañia creada con exito.'
            redirect_to companies_path
        else    
            render 'new'
        end
    end
    
    def show
        @company = current_user.company
        @users = @company.users 
        @orders = Order.where(company_id: @company.id)
    end
      
    
    def edit
        @company = Company.find(params[:id])
    end
    
    def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
            redirect_to @company
        else
            render 'edit'
        end
    end
    
    def destroy
        @company = Company.find(params[:id])
        @company.destroy
        redirect_to companies_path
    end
    
    private
    
    def company_params
        params.require(:company).permit(:nit, :razon_social, :id, :rut, :avatar)
    end

    def user
        unless current_user.admin?
          redirect_to company_path(current_user.company_id), alert: "Acceso no autorizado."
        end
    end
end
