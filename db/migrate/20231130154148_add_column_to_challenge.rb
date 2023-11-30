class AddColumnToChallenge < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :number_of_days, :integer
    add_column :challenges, :title, :string 
  end
end
