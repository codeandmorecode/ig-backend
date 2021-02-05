json.extract! photo, :id, :photo_id, :country, :state, :city, :landmark, :latitude, :longitude, :perspective, :user_id, :photo_url, :created_at, :updated_at
json.url photo_url(photo, format: :json)
