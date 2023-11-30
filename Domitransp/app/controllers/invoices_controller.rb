class InvoicesController < ApplicationController

    def index
        
        if params[:q]
            @invoices = Invoice.joins(:company).where("lower(companies.razon_social) like ?", "%#{params[:q].downcase}%")
        elsif params[:numero_factura]
            @invoices = current_user.company.invoices.where(numero_factura: params[:numero_factura])
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
            redirect_back(fallback_location: new_invoice_path, alert: 'Error al crear la factura. Por favor, verifica los datos e inténtalo de nuevo.')
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
