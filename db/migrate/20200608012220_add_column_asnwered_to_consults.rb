class AddColumnAsnweredToConsults < ActiveRecord::Migration[5.2]
  def change
    add_column :consults, :answered, :integer
  end
end
