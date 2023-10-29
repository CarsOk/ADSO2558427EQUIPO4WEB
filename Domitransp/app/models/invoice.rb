class Invoice < ApplicationRecord
  belongs_to :company
  mount_uploader :factura, DocumentUploader
  mount_uploader :certificacion, DocumentUploader
  validates :numero_factura, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :factura, presence: true
  validates :certificacion, presence: true
  validates :mes_factura, presence: true
  validates :company_id, presence: true
end
