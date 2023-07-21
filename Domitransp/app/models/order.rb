class Order < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :packs, dependent: :destroy
  accepts_nested_attributes_for :packs, allow_destroy: true, reject_if: proc { |att| att['tipo'].blank? }
end
