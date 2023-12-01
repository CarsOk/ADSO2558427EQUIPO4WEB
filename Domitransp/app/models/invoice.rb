class Invoice < ApplicationRecord
  belongs_to :company
  mount_uploader :factura, DocumentUploader
  mount_uploader :certificacion, DocumentUploader
  validates :factura, presence: true
  validates :certificacion, presence: true
  validates :mes_factura, presence: true
  validates :company_id, uniqueness: { scope: :mes_factura, message: "ya tiene una factura para este mes." }
  validates :numero_factura, presence: true, uniqueness: { message: "ya ha sido utilizado. Debe ser único." },
  numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 1000 }
  validate :three_digit_number

  private

  def three_digit_number
    unless numero_factura.to_s.length == 3
      errors.add(:numero_factura, "debe tener exactamente 3 dígitos")
    end
  end
end
