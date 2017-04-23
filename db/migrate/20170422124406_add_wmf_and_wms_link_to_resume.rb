class AddWmfAndWmsLinkToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :wmf_link, :string
    add_column :resumes, :wms_link, :string
  end
end
