class ChangePasswordMailer < Devise::Mailer
    helper :application
    include Devise::Controllers::UrlHelpers
  
  
    def reset_password_instructions(record, token, opts = {})
      @token = token
      @resource = record
      @opts = opts
      mail(
        to: @resource.email,
        subject: 'Restablece tu contraseña'
      )
    end
  end