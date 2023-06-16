class HomeController < ApplicationController
def index
    @mainTitle = "Welcome to Inspinia Rails Seed Project" 
    @mainDesc = "It is an application skeleton for a typical Ruby on Rails web app. You can use it to quickly bootstrap your webapp projects and dev/prod environment."
    @orders = Order.last
    

end

def minor
end

end
