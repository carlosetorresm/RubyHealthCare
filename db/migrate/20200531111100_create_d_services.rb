class CreateDServices < ActiveRecord::Migration[5.2]
  def change
    create_table :d_services do |t|
      t.references :service, foreign_key: true
      t.references :doctor, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
