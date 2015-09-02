module Api
  module V1
    module Private
      module Validations

        class LocationsValidator < ActiveModel::Validator
          def validate(record)
            unless record.locations.is_a?(Array)
              record.errors[:unknown_parameters] << "Locations parameter must be an Array of id and panel_size structure"
            end
          end
        end

        class TargetGroup
          include ActiveModel::Validations

          attr_accessor :country_code, :target_group_id, :token, :locations

          validates :country_code, presence: true
          validates :target_group_id, presence: true, numericality: true
          validates :locations, presence: true
          validates_with LocationsValidator
          validates :token, presence: true

          def initialize(params={})
            @country_code = params[:country_code]
            @target_group_id = params[:target_group_id]
            @locations = params[:locations] || []
            @token = params[:token]

            ActionController::Parameters.new(params).permit(:country_code, :target_group_id, :token, locations: [:id, :panel_size])
          end

        end
      end
    end
  end
end
