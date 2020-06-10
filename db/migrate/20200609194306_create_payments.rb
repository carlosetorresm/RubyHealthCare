class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :patient, foreign_key: true
      t.string :name
      t.string :lastname
      t.bigint :number
      t.integer :secret_code
      t.string :exdate

      t.timestamps
    end
  end
end
