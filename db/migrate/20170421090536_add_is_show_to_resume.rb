class AddIsShowToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :is_show, :boolean, default: false
  end
end
