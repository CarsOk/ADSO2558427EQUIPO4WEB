class CompaniesController < ApplicationController
    def index
        @empresas = Company.all
        @companies = Company.all
        
        if params[:filter].present? && params[:filter][:company_id].present?
            @selected_company = Company.find(params[:filter][:company_id])
            @companies = @companies.where(id: @selected_company.id)
        end
    end
    
    def show
        @company = Company.find(params[:id])
    end
    
    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to @company
        else
            render 'new'
        end
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
        params.require(:company).permit(:nit, :razon_social, :id, :rut)
    end
end
