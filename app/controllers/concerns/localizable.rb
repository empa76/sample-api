# encoding: UTF-8
module Localizable
  extend ActiveSupport::Concern

  included do
    def fetch_location(country_code)
      Location.by_country_code(country_code)
    end
  end
end
