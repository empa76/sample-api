Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :public do
        resources :locations, only: [:show], param: :country_code
        resources :target_groups, only: [:show], param: :country_code
      end
      namespace :private do
        resources :locations, only: [:show], param: :country_code
        resources :target_groups, only: [:show], param: :country_code
      end
    end
  end
end
