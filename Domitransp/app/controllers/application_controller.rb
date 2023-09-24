class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    include Pundit::Authorization
    def razonsocial
        @user = current_user  
        @razon_social = @user.company.razonSocial   
        puts "Razón Social: #{@razon_social}"   
    end
end
