module Api
  module V1
    module Private
      class TargetGroupsController < BaseController
        include Targetable

        ActionController::Parameters.action_on_unpermitted_parameters = :raise

        before_action :validate_params_presence, only: :create

        expose(:country_code) { params[:country_code] }
        expose(:panel_provider) { PanelProvider.by_country_code(country_code).first }

        rescue_from ActionController::UnpermittedParameters do |exc|
          render json: { error: { unknown_parameters: exc.params } }, status: :bad_request
        end

        rescue_from ActionController::ParameterMissing do
          render json: { error: 'Missing parameters' }, status: :bad_request
        end

        def show
          render json: fetch_target_groups(params[:country_code]), each_serializer: TargetGroupPrivateSerializer
        end

        def create
          render json: { error: 'Panel provider not found!' }, status: :not_found and return unless panel_provider.present?
          render json: { price: panel_provider.decorate.price }
        end

        private

        def validate_params_presence
          validator = Validations::TargetGroup.new(params)
          render json: { error: validator.errors } unless validator.valid?
        end
      end
    end
  end
end
