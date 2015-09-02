require 'rails_helper'

describe 'api/v1/public/location' do

  before do
    FactoryGirl.create_list(:panel_provider_with_country, 2)
  end

  describe :show do
    before do
      code = Country.last.country_code
      get api_v1_public_location_path(country_code: code)
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it 'get all locations for given country_code' do
      expect(response_json["locations"]).to have(4).items
    end
  end
end
