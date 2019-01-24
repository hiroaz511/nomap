class User < ApplicationRecord
	  has_secure_password validations: false
	  has_many :shops
	  has_many :reviews
	  has_many :favorites, dependent: :destroy
	  validates :name, {presence: true}
	  validates :email, {presence: true}
	  validates :email, {uniqueness: true}
	  validates :password_digest, {presence: true}
end
