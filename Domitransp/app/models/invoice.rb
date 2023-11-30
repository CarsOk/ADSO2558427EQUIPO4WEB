class Invoice < ApplicationRecord
  belongs_to :company
  mount_uploader :factura, DocumentUploader
  mount_uploader :certificacion, DocumentUploader
  validates :factura, presence: true
  validates :certificacion, presence: true
  validates :mes_factura, presence: true
  validates :company_id, presence: true

  validates :invoice_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 1000 }
  validate :three_digit_number

  private

  def three_digit_number
    unless invoice_number.to_s.length == 3
      errors.add(:invoice_number, "debe tener exactamente 3 dígitos")
    end
  end
end
