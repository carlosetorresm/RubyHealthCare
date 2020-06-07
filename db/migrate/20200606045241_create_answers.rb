class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :consult, foreign_key: true
      t.references :doctor, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
