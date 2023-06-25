class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    authorize :user, through: :current_user
  
    # Resto de las acciones del controlador
end
  