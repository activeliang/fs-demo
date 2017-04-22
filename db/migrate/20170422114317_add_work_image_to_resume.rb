class AddWorkImageToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :wmf, :string
    add_column :resumes, :wms, :string
  end
end
