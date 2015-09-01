class CountrySerializer < ActiveModel::Serializer
  attributes :country_code
  has_one :panel_provider
end
