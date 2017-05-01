class ChangeJobWageType2 < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :wage_upper_bound, :string
    change_column :jobs, :wage_lower_bound, :string
  end
end
