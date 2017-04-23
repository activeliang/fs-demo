class AddWechatimgToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :wechatimg, :string
  end
end
