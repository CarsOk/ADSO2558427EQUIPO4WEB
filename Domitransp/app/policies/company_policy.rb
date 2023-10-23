class CompanyPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
  def new?
    user.admin?
  end
end
