class Review < ApplicationRecord
	validates :reviewer, {presence: true}
	validates :rate, {presence: true, length: { maximum: 1 }}
	validates :body, {presence: true}

	belongs_to :shop
end
