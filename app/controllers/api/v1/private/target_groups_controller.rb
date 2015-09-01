module Api
  module V1
    module Private
      class TargetGroupsController < BaseController
        include Targetable

        def show
          render json: fetch_target_groups(params[:country_code]), each_serializer: TargetGroupPrivateSerializer
        end

        def create
          calculate_price
        end

        private

          def calculate_price

          end
      end
    end
  end
end
