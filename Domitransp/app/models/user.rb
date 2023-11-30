class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :company, counter_cache: true
  has_many :orders
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :nombre, :apellido, format: { with: /\A[a-zA-Z\s]+\z/, message: "solo permite caracteres alfabéticos y espacios" }

  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  def first_login?
    self.first_login
  end
end
