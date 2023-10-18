class Company < ApplicationRecord
    has_many :users
    mount_uploader :rut, RutUploader
    has_many :invoices
    mount_uploader :avatar, AvatarUploader
    has_many :orders
    
end
