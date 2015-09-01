class LocationGroup < ActiveRecord::Base
  belongs_to :country
  belongs_to :panel_provider
  has_many :areas
  has_many :locations, through: :areas
end
