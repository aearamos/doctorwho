class CreateTreatmentspecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :treatmentspecialties do |t|
      t.references :doctor, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
