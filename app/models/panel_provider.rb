class PanelProvider < ActiveRecord::Base
  has_many :location_groups
  has_many :countries
end
