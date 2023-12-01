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
  validates :consecutivo, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { maximum: 5 }, uniqueness: true

  validates :origen, presence: true
  validates :destino, presence: true
  validates :avatar, presence: true
  
  validates :valor, numericality: { greater_than_or_equal_to: 0 }
  validate :fecha_within_five_days, on: :create
  

  private


  def generate_shipping_code
    self.codigo_envio = SecureRandom.hex(10).upcase
  end
  
  def fecha_within_five_days
    if fecha.present? && (fecha < 5.days.ago.to_date || fecha > 5.days.from_now.to_date)
      errors.add(:fecha, "debe estar dentro de los últimos 5 días y los próximos 5 días")
    end
  end
end
