class CreateMedicaments < ActiveRecord::Migration[5.2]
  def change
    create_table :medicaments do |t|
      t.string :name
      t.references :type_medication, foreign_key: true
      t.string :active
      t.string :presentation
      t.float :price

      t.timestamps
    end
  end
end
