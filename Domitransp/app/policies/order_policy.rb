class OrderPolicy < ApplicationPolicy
    def update?
      user.admin?
    end

    def create?
      user.admin?
    end
    def edit_order?
      user.admin?
    end
    
end