class OrderMailer < ApplicationMailer
  def status(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: "Estado de orden cambiado")
  end
  def new_order(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: "Nueva Orden Creada")
  end
end
