class UserPolicy < ApplicationPolicy
  def admin?
    user.admin?
  end
  def destroy?
    admin? # o cualquier otra lógica que permita eliminar usuarios
  end
end
