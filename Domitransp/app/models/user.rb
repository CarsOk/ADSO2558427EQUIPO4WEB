class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :company, counter_cache: true
  has_many :orders
  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
end
