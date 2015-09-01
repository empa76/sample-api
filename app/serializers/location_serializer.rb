class LocationSerializer < ActiveModel::Serializer
  attributes :name, :external_id
  self.root = false
end
