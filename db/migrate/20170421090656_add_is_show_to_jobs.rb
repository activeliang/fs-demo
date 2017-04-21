class AddIsShowToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_show, :boolean, default: false
  end
end
