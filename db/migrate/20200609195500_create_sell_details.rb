class CreateSellDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_details do |t|
      t.references :sell, foreign_key: true
      t.references :medicament, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
