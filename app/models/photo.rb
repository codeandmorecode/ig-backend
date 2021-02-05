class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :photo_id, type: Integer
  field :country, type: String
  field :state, type: String
  field :city, type: String
  field :landmark, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  field :perspective, type: String
  field :user_id, type: Integer
  field :photo_url, type: String
end
