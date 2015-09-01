class LocationGroupSerializer < ActiveModel::Serializer
  attributes :name
  has_one :country
end
