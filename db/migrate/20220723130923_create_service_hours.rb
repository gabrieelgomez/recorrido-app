class CreateServiceHours < ActiveRecord::Migration[7.0]
  def change
    create_table :service_hours do |t|
      t.datetime :hour
      t.boolean :available, default: true
      t.references :service_day, null: false, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
