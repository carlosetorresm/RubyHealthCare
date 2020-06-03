class CreateConsults < ActiveRecord::Migration[5.2]
  def change
    create_table :consults do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.references :speciality, foreign_key: true
      t.text :symptoms
      t.boolean :closed

      t.timestamps
    end
  end
end
