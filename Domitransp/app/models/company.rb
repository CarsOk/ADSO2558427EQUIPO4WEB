class Company < ApplicationRecord
    has_many :users
    mount_uploader :rut, RutUploader
    has_many :invoices
    mount_uploader :avatar, AvatarUploader
    has_many :orders
    validates :nit, presence: true, numericality: { only_integer: true }
    validates :razon_social, presence: true
    validates :rut, presence: true
end
