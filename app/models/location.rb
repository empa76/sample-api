class Location < ActiveRecord::Base
  has_many :areas
  has_many :location_groups, through: :areas

  scope :by_country_code, -> (country_code) {
    includes(location_groups: [:country])
    .where(countries: {country_code: country_code})
  }
end
