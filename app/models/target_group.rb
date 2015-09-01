class TargetGroup < ActiveRecord::Base
  acts_as_tree
  belongs_to :panel_provider
  has_many :objectives
  has_many :countries, through: :objectives

  scope :by_country_code, -> (country_code) {
    joins(:countries)
    .includes(:panel_provider)
    .where(countries: {country_code: country_code})
    .where(parent_id: nil)
  }
end
