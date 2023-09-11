class Order < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :packs, dependent: :destroy
  accepts_nested_attributes_for :packs, allow_destroy: true, reject_if: proc { |att| att['tipo'].blank? }
  
  before_create :generate_shipping_code

  private

  def generate_shipping_code
    self.codigo_envio = SecureRandom.hex(10).upcase
  end
end
