class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.integer :resume_id
      t.string :re_tag
      t.timestamps
    end
  end
end
