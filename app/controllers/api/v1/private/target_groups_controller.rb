module Api
  module V1
    module Private
      class TargetGroupsController < BaseController
        include Targetable

        decent_configuration do
          strategy DecentExposure::StrongParametersStrategy
        end

        expose(:target_group, attributes: :target_group_params)
        expose(:country_code) { params[:target_group][:country_code] }
        expose(:panel_provider) { PanelProvider.by_country_code(country_code).first }

        def show
          render json: fetch_target_groups(params[:country_code]), each_serializer: TargetGroupPrivateSerializer
        end

        def create
          render json: { error: 'Bad request' }, status: :bad_request and return unless panel_provider.present?
          render json: { price: panel_provider.decorate.price }
        end

        private

          def target_group_params
            allowed_params = [
              :country_code,
              :target_group_id,
              locations: [
                :id,
                :size
              ]
            ]
            params.require(:target_group).permit(allowed_params)
          end
      end
    end
  end
end
