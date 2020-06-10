class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.references :patient, foreign_key: true
      t.references :shipping, foreign_key: true
      t.references :payment, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
