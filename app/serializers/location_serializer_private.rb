class LocationSerializerPrivate < LocationSerializer
  attributes :id, :secret_code, :external_id
  has_many :location_groups
end
