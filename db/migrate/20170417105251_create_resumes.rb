class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.string :semester
      t.string :work_place
      t.integer :user_id
      t.text :description
      t.string :app_image
      t.string :logdown
      t.string :fs_username
      t.string :contact_email
      t.timestamps
    end
  end
end
