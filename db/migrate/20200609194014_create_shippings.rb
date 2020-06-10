class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.references :patient, foreign_key: true
      t.string :city
      t.string :state
      t.string :country
      t.bigint :postal_code
      t.string :name
      t.string :lastname
      t.text :detail

      t.timestamps
    end
  end
end
