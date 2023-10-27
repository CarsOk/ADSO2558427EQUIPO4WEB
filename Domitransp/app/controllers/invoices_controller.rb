class InvoicesController < ApplicationController

    def index
        if params[:q]
            @invoices = Invoice.joins(:company).where("lower(companies.razon_social) like ?", "%#{params[:q].downcase}%")
        else
            @invoices = Invoice.all
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
    
    
    private
    
    def invoice_params    
        params.require(:invoice).permit(:numero_factura, :mes_factura, :factura, :certificacion, :company_id)       
    end
    
end
