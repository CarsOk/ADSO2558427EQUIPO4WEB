class InvoicesController < ApplicationController

    def index
        
        if params[:q]
            @invoices = Invoice.joins(:company).where("lower(companies.razon_social) like ?", "%#{params[:q].downcase}%")
        else
            set_invoices
        end
    end
    
    def new
        @companies = Company.all
        @invoice = Invoice.new
        @months = I18n.t('date.month_names')[1..12]
    end
    def create
        @invoice = Invoice.new(invoice_params)
    
        if @invoice.save
            flash[:notice] = 'Factura enviada exitosamente.'
            redirect_to invoices_path
        else
            render :new
        end
    end
    
    def destroy
        @invoice = Invoice.find(params[:id])
        @invoice.destroy
        redirect_to invoices_path, notice: 'La factura fue eliminada exitosamente.'
    end
    private
    
    def invoice_params    
        params.require(:invoice).permit(:numero_factura, :mes_factura, :factura, :certificacion, :company_id)       
    end

    def set_invoices
        if current_user.admin?
            @invoices = Invoice.all
        else
            
            @invoices = current_user.company.invoices
        end
    end
end
