class AddColumnToPrescriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :prescriptions, :subject, :string
  end
end
