class AddWmfAndWmsGithub < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :wms_git, :string
    add_column :resumes, :wmf_git, :string
  end
end
