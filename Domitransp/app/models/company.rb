class Company < ApplicationRecord
    has_many :users
    mount_uploader :rut, RutUploader
    has_many :invoices
    has_many :orders
end
