# encoding: UTF-8
module Targetable
  extend ActiveSupport::Concern

  included do
    def fetch_target_groups(country_code)
      TargetGroup.by_country_code(country_code)
    end
  end
end
