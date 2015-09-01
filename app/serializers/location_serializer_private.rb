class LocationSerializerPrivate < LocationSerializer
  attributes :secret_code
  has_many :location_groups
end
