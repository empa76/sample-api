module Api
  module V1
    module Public
      class LocationsController < ApplicationController
        include Localizable

        def show
          render json: fetch_location(params[:country_code])
        end
      end
    end
  end
end
