# encoding: UTF-8
FactoryGirl.define do

  factory :panel_provider do
    sequence(:code) { |n| "Panel_code_#{n}" }
    factory(:panel_provider_with_country) do
      transient do
        item_count 2
      end

      after(:create) do |object, evaluator|
        create_list(:country_with_location_groups, evaluator.item_count, panel_provider: object)
      end
    end
  end

  factory :country do
    sequence(:country_code) { |n| "country_code_#{n}" }
    factory(:country_with_location_groups) do
      transient do
        item_count 2
      end

      after(:create) do |object, evaluator|
        create_list(:location_group_for_area, evaluator.item_count, country: object, panel_provider: object.panel_provider)
      end
    end
  end

  factory :location do
    sequence(:name) { |n| "Location_#{n}" }
    sequence(:external_id) { |n| "External_#{n}" }
    sequence(:secret_code) { |n| "Secret_#{n}" }
  end

  factory :area do
    location
    location_group
    factory(:area_with_location) do
      transient do
        item_count 2
      end

      after(:create) do |object, evaluator|
        create_list(:location, evaluator.item_count)
      end
    end
  end

  factory :location_group do
    sequence(:name) { |n| "Location_#{n}" }
    factory(:location_group_for_area) do
      transient do
        item_count 2
      end

      after(:create) do |object, evaluator|
        create_list(:area_with_location, evaluator.item_count, location_group: object)
      end
    end
  end
end
