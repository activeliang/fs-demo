class ChangeJobWageType < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :cp_number, :string
  end
end
