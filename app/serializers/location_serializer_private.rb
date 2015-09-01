class LocationSerializerPrivate < LocationSerializer
  attributes :secret_code, :external_id
  has_many :location_groups
end
