class Company < ApplicationRecord
    has_many :users
    mount_uploader :rut, RutUploader
    
end
