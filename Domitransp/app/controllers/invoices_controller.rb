class InvoicesController < ApplicationController

    def index
        @invoices = Invoice.all
    end
    
    def new
        @companies = Company.all
        @invoice = Invoice.new
        @months = Date::MONTHNAMES[1..12]
    end
    def create
        @invoice = Invoice.new(invoice_params)
    
        if @invoice.save
            redirect_to invoices_path, notice: "Factura enviada exitosamente."
        else
            render :new
        end
    end
    
    
    private
    
    def invoice_params    
        params.require(:invoice).permit(:numero_factura, :mes_factura, :factura, :certificacion, :company_id)       
    end
    
end
