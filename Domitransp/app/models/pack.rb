class Pack < ApplicationRecord
  belongs_to :order, optional: true

  validates :tipo, presence: true
  validates :cantidad, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
