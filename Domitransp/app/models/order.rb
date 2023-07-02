class Order < ApplicationRecord
  belongs_to :description
  belongs_to :beginning
  belongs_to :destination
  mount_uploader :avatar, AvatarUploader
  has_many :packs
end
