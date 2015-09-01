module Api
  module V1
    module Private
      class LocationsController < BaseController
        include Localizable

        def show
          render json: fetch_location(params[:country_code]), each_serializer: LocationSerializerPrivate
        end
      end
    end
  end
end
