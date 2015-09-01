module Api
  module V1
    module Public
      class TargetGroupsController < ApplicationController
        include Targetable

        def show
          render json: fetch_target_groups(params[:country_code])
        end
      end
    end
  end
end
