class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :location_groups
  has_many :objectives
  has_many :target_groups, -> { where 'parent_id IS NULL' }, through: :objectives
end
