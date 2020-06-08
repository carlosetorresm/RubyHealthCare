class CreateCovidConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :covid_conditions do |t|
      t.references :patient, foreign_key: true
      t.references :condition, foreign_key: true

      t.timestamps
    end
  end
end
