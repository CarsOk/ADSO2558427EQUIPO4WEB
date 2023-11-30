class Company < ApplicationRecord
    has_many :users
    mount_uploader :rut, RutUploader
    has_many :invoices
    mount_uploader :avatar, AvatarUploader
    has_many :orders
    validates :nit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, length: { is: 9 }
    validates :razon_social, presence: true
    validates :rut, presence: true
    validate :unique_nit_and_razon_social_combination

    private
    def unique_nit_and_razon_social_combination
        existing_company = Company.find_by(nit: nit, razon_social: razon_social)
        errors.add(:base, 'Ya existe una empresa con el mismo NIT y razón social') if existing_company.present? && existing_company != self
    end
    def validate_rut_format
        if rut.present? && !FileUtils.pdf?(rut.path)
            errors.add(:rut, 'El archivo debe ser un PDF')
        end
    end
end
