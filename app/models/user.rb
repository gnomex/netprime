class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :email, presence: true, email: true

  has_many :videos, dependent: :destroy
end
