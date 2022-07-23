class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.json :settings_per_day
      t.boolean :available, default: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
