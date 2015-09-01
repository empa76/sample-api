module Api
  module V1
    module Private
      class TargetGroupsController < BaseController
        include Targetable

        def show
          render json: fetch_target_groups(params[:country_code]), each_serializer: TargetGroupPrivateSerializer
        end
      end
    end
  end
end
