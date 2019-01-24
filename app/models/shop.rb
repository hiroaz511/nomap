class Shop < ApplicationRecord
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	validates :name, presence: { message: '店鋪名は必須項目です' }
	validates :station, presence: { message: '最寄り駅は必須項目です' }
	# validates :tell_num, exclusion: { in: /[a-zA-Z]/, message: "半角数字のみが使用できます" }
	validates :tell_num, format: { with: /[0-9]/, message: "半角数字のみが使用できます", allow_blank: true},
						 length: { minimum: 9, maximum: 11, message: "番号の桁数が正しくありません", allow_blank: true}

	def review_rate
		review_rate = Review.where(shop_id: self.id).average(:rate)
		return review_rate
	end
end