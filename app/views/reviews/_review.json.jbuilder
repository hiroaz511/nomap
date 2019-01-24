json.extract! review, :id, :reviewer, :rate, :body, :shop_id, :created_at, :updated_at
json.url review_url(review, format: :json)
