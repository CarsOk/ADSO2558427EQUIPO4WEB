class Pack < ApplicationRecord
  belongs_to :order, optional: true
end
