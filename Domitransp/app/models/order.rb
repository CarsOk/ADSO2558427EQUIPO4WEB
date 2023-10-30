class Order < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :packs, dependent: :destroy
  accepts_nested_attributes_for :packs, allow_destroy: true, reject_if: proc { |att| att['tipo'].blank? }
  belongs_to :dispatch, optional: true
  belongs_to :user
  belongs_to :company
  before_create :generate_shipping_code
  attribute :valor, :decimal, default: 0
  validates :consecutivo, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { maximum: 5 }
  validates :origen, presence: true
  validates :destino, presence: true
  validates :avatar, presence: true
  private

  def generate_shipping_code
    self.codigo_envio = SecureRandom.hex(10).upcase
  end
  
end
