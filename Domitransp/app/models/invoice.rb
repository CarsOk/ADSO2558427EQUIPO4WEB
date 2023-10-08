class Invoice < ApplicationRecord
  belongs_to :company
  mount_uploader :factura, DocumentUploader
  mount_uploader :certificacion, DocumentUploader
end
