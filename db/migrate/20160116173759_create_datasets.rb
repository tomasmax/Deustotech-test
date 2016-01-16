class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :object_name
      t.string :license_title
      t.string :license_url

      t.timestamps null: false
    end
  end
end
