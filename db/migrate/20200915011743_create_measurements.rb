class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.string :temperature
      t.string :blood
      t.string :oximeter_spo2
      t.string :oximeter_pr

      t.timestamps
    end
  end
end
