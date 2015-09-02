class PanelProvider < ActiveRecord::Base
  has_many :location_groups
  has_many :countries

  scope :by_country_code, -> (country_code) {
    joins(:countries)
    .where(countries: {country_code: country_code})
  }
end
