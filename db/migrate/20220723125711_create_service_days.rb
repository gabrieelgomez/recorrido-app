class CreateServiceDays < ActiveRecord::Migration[7.0]
  def change
    create_table :service_days do |t|
      t.date :date
      t.datetime :start_hour
      t.datetime :end_hour
      t.boolean :available, default: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
