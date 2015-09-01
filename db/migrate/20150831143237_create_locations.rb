class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :external_id
      t.string :secret_code

      t.timestamps null: false
    end

    create_table :areas do |t|
      t.belongs_to :location, index: true
      t.belongs_to :location_group, index: true
    end
  end
end
