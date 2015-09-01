module Api
  module V1
    module Private
      class BaseController < ApplicationController

        before_filter :authenticate

        private
          def authenticate
            render json: { error: 'Unauthorized access!' }, status: :unauthorized unless authorized?
          end

          def authorized?
            params[:token] == 'too-many-secrets'
          end
      end
    end
  end
end
