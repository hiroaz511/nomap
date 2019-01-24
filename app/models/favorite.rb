class Favorite < ApplicationRecord
	# validates: user_id, {precense: true}
	# validates: shop_id, {precense: true}
	belongs_to :user
	belongs_to :shop
end
