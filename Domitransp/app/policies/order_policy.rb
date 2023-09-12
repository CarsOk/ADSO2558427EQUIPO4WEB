class OrderPolicy < ApplicationPolicy
    def update?
      user.admin?
    end
end