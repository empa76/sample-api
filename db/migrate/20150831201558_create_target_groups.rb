class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name
      t.string :external_id
      t.string :secret_code
      t.integer :parent_id, index: true
      t.references :panel_provider, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :objectives do |t|
      t.belongs_to :country, index: true
      t.belongs_to :target_group, index: true
    end
  end
end
