class LocationSerializer < ActiveModel::Serializer
  attributes :name
  self.root = false
end
