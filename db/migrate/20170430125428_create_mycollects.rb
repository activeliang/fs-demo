class CreateMycollects < ActiveRecord::Migration[5.0]
  def change
    create_table :mycollects do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :resume_id
      t.boolean :is_of_job, default: true
      t.timestamps
    end
  end
end
