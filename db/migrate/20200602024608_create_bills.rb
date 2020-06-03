class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.text :body
      t.float :total

      t.timestamps
    end
  end
end
