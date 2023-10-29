class HomeController < ApplicationController
    
  def index
    @mainTitle = "Welcome to Inspinia Rails Seed Project" 
    @mainDesc = "It is an application skeleton for a typical Ruby on Rails web app. You can use it to quickly bootstrap your webapp projects and dev/prod environment."
    @dispatches = Dispatch.all
    if policy(current_user).admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
    if policy(current_user).admin?
      @pendientes = Order.where(estado: "En espera")

    else
      @pendientes = Order.where(company_id: current_user.company_id, estado: "En espera")

    end
    
    
  end  
def minor
end

end
