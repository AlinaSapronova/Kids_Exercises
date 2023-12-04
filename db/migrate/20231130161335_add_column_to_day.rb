class AddColumnToDay < ActiveRecord::Migration[7.0]
  def change
    add_column :days, :number, :integer
  end
end
